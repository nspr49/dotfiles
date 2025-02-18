return {
  'mfussenegger/nvim-jdtls',
  ft = "java",
  --only open in java file
  --  list of file that exists in root of the project
  dependencies = {
    "mfussenegger/nvim-dap"
  }
}
