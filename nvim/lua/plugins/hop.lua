return {
  "phaazon/hop.nvim",
  config = function()
    require("hop").setup({
      keys = "hklyuiopnm,qwertzxcvbasdgjf;",
      jump_on_sole_occurrence = true,
    })
  end,
}