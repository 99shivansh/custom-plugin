return {
  name = "custom-log",
  fields = {
    { config = {
        type = "record",
        fields = {
          { path = { type = "string", required = true } },
        },
      },
    },
  },
}
