// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AvailabilityController from "./availability_controller"
application.register("availability", AvailabilityController)

import ChatroomSubscriptionController from "./chatroom_subscription_controller"
application.register("chatroom-subscription", ChatroomSubscriptionController)

import FormController from "./form_controller"
application.register("form", FormController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)
