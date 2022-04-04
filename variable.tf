variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
variable "vydnd-rg" {
  type = string
}
variable "vydnd-kv" {
  type = string
}
variable "secret_maps" {
    type = map(string)
    default = {}
}