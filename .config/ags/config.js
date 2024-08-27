import GLib from "gi://GLib?version=2.0"
const hyprland = await Service.import("hyprland")
const notifications = await Service.import("notifications")
const mpris = await Service.import("mpris")
const audio = await Service.import("audio")
const battery = await Service.import("battery")

const date = Variable("", {
    poll: [1000, ' date "+%H:%M %d-%m-%y"'],
})

// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it

function Workspaces() {
    const activeId = hyprland.active.workspace.bind("id")
    const workspaces = hyprland.bind("workspaces")
        .as(ws =>  ws.sort((a,b) => a.id - b.id)
          .map(({ id }) => Widget.Button({
            on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
            child: Widget.Label(`${id}`),
            class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
        })))
    return Widget.Box({
        class_name: "workspaces",
        children: workspaces,
    })
}


function ClientTitle() {
    return Widget.Label({
        class_name: "client-title",
        label: hyprland.active.client.bind("title"),
    })
}


function Clock() {
    return Widget.Label({
        class_name: "clock",
        label: date.bind(),
    })
}


// we don't need dunst or any other notification daemon
// because the Notifications module is a notification daemon itself
function Notification() {
    const popups = notifications.bind("popups")
    return Widget.Box({
        class_name: "notification",
        visible: popups.as(p => p.length > 0),
        children: [
          Widget.Button({
            child: 
            Widget.Icon({
                icon: "preferences-system-notifications-symbolic",
            }),
                 }),
            Widget.Label({
                label: popups.as(p => p[0]?.summary || ""),
            }),
        ],
    })
}


function Media() {
    const label = Utils.watch("", mpris, "player-changed", () => {
        if (mpris.players[0]) {
            const { track_artists, track_title } = mpris.players[0]
            return `${track_artists.join(", ")} - ${track_title}`
        } else {
            return "Nothing is playing"
        }
    })

    return Widget.Button({
        class_name: "media",
        on_primary_click: () => mpris.getPlayer("")?.playPause(),
        on_scroll_up: () => mpris.getPlayer("")?.next(),
        on_scroll_down: () => mpris.getPlayer("")?.previous(),
        child: Widget.Label({ label }),
    })
}


function Volume() {
    const icons = {
        101: "overamplified",
        67: "high",
        34: "medium",
        1: "low",
        0: "muted",
    }

    function getIcon() {
        const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
            threshold => threshold <= audio.speaker.volume * 100)

        return `audio-volume-${icons[icon]}-symbolic`
    }

    const icon = Widget.Icon({
        icon: Utils.watch(getIcon(), audio.speaker, getIcon),
        
    })

    function callsound() {
      App.getWindow("sound") == undefined ? App.addWindow(sound()) 
        : App.removeWindow("sound");
    }

    const button = Widget.Button({
      on_clicked: callsound,
      child: icon,
    })

  /*
    const slider = Widget.Slider({
        hexpand: true,
        draw_value: false,
        on_change: ({ value }) => audio.speaker.volume = value,
        setup: self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume || 0
        }),
    })*/

    return Widget.Box({
        class_name: "volume",
        css: "",
        children: [button ],
    })
}


function BatteryLabel() {
    const value = battery.bind("percent").as(p => p > 0 ? p / 100 : 0)
    const state = battery.bind("percent").as(p =>
        `battery-level-${Math.floor(p / 10) * 10}-symbolic`)
  //const data = battery.bind("percent").as(p => `${p} %`)
    return Widget.Box({
        class_name: "battery",
        visible: battery.bind("available"),
        children: [
            //Widget.Icon({ label: icon }),
            Widget.Label({
              visible: battery.bind("charging"),
              label: "",
            }),
          Widget.Label({
              visible: battery.bind("charging").as(charging => !charging),
              label: "",
            }),
            Widget.Label({
              class_name: "batteryPercentage",
              label: battery.bind("percent").as(p=> ""+Math.floor(p.valueOf())+ "%") ,
            }),
            Widget.LevelBar({
                widthRequest: 140,
                vpack: "center",
                value,
            }),
        ],
    })
}



// layout of the bar
function Left() {
    return Widget.Box({
        spacing: 8,
        children: [
            Workspaces(),
        ],
    })
}

function Center() {
    return Widget.Box({
        spacing: 8,
        children: [
            ClientTitle(),
            //Media(),
           // Notification(),
        ],
    })
}

function sound() {
  const outputs = audio
    .speakers.map(function(speaker)  { return "" + speaker.description });

  const labels = outputs.map(function(out)  {
    return Widget.Label({
      class_name: "sound-text",
      hpack: "start",
      label:out,
    });
  })
  const sliders = [];
  for(let i = 0; i<outputs.length; i++){
    sliders.push(Widget.Slider({
      draw_value: false,
      css: "min-height: 10px;",
      on_change: ({ value }) => audio.speakers[i].volume = value,
      setup: self => self.hook(audio.speakers[i], () => {
        self.value = audio.speakers[i].volume || 0
      })
    })
    )
  }

  const box_names = Widget.Box({
    vertical: true,
    children: labels,
  });

  const box_sliders = Widget.Box({
    vertical: true,
    class_name:"sliders",
    css: "min-width: 180px",
    children: sliders,
  });

  function close() {
    App.closeWindow("sound");
  }

  const header = Widget.Box({
    vertical: false,
    hexpand: true,
    class_name: "sound-header",
    children: [
      Widget.Label({
        label: "Audio Control"
      }),
      Widget.Button({
        hexpand: true,
        hpack: "end",
        css: "max-width:0.5em;max-height: 1em;",
        on_clicked: close,
        label:"x",
      }),
    ],
  })

    return Widget.Window({
      name:"sound",
      class_name:"sound",
        anchor: ["top", "right"],
        exclusivity: "exclusive",
        child: Widget.Box({
        class_name: "sound-box",
          vertical: true,
          css:"padding-left: 1em; padding-right: 1em",
          children:[
            header,
            Widget.Box({
                vertical: false,
              class_name: "sound-body",
              children: [
                box_names,
                box_sliders,
              ],
            }),
        ],
        }),
    })
}

function Right() {
    return Widget.Box({
        hpack: "end",
        spacing: 8,
        children: [
            Volume(),
            BatteryLabel(),
            Clock(),
        ],
    })
}

function Bar(monitor = 0) {
    return Widget.Window({
        name: `bar-${monitor}`, // name has to be unique
        class_name: "bar",
        monitor,
        anchor: ["top", "left", "right"],
        exclusivity: "exclusive",
        child: Widget.CenterBox({
            start_widget: Left(),
            center_widget: Center(),
            end_widget: Right(),
        }),
    })
}

function monitor() {
  let monitors = [];
  for (let i = 0; i < hyprland.monitors.length; i++) {
    monitors.push(Bar(i));
  }
  return monitors;
}

function getCurosr() {
  const cursor = GLib.getenv("XCURSOR_THEME"); 
  console.log(cursor);
  return cursor == null ? "catppuccin-mocha-mauve-cursors 32" : cursor;
}

App.config(

  {
  style: "./style.css",
  windows: monitor(),
  cursorTheme: getCurosr(),
});

export {};
