return {
  'javiorfo/nvim-wildcat',
  lazy = true,
  cmd = { "WildcatRun", "WildcatUp", "WildcatInfo" },
  dependencies = { 'javiorfo/nvim-popcorn' },
  config = function ()
    require'wildcat'.setup{
      jboss = {
        home = "~/documents/wildfly-33/wildfly-33.0.0.Final/",
        default = true
      }
    }
  end 
}
