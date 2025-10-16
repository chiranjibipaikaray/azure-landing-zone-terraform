variable "rg_var" {

  type = map(object
    (
      { name = string
      location = string }
    )
  )

}
