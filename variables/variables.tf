/*
variable "instancetype" {
    default = "t2.micro"
}
*/

variable "elb_name" {
    type = string
}
variable "az" {
    type = list
}
variable "timeout" {
    type = number
}