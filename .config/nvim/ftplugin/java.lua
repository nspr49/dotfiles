local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
      java = {
        format = {
          settings = {
            url = '/home/extra/dotfiles/eclipse_style.xml',
          }
        }
      }
    }
}
require('jdtls').start_or_attach(config)
