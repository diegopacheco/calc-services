package com

import akka.actor.ActorSystem
import akka.http.scaladsl.Http
import akka.http.scaladsl.model._
import akka.http.scaladsl.server.Directives._
import akka.stream.ActorMaterializer
import scala.io.StdIn

object App {
  def main(args: Array[String]) {
    implicit val system = ActorSystem("my-system")
    implicit val materializer = ActorMaterializer()
    implicit val executionContext = system.dispatcher

    val DIV_SERVICE_URL = System.getenv("DIV_SERVICE_URL")
    val SUB_SERVICE_URL = System.getenv("SUB_SERVICE_URL")
    val MUL_SERVICE_URL = System.getenv("MUL_SERVICE_URL")
    val SUM_SERVICE_URL = System.getenv("SUM_SERVICE_URL")
    println(s"DIV_SERVICE_URL=${DIV_SERVICE_URL} \n SUB_SERVICE_URL=${SUB_SERVICE_URL} \n MUL_SERVICE_URL=${MUL_SERVICE_URL} \n SUM_SERVICE_URL=${SUM_SERVICE_URL} \n")    

    SolveRPN.DIV_SERVICE_URL=DIV_SERVICE_URL
    SolveRPN.SUB_SERVICE_URL=SUB_SERVICE_URL
    SolveRPN.MUL_SERVICE_URL=MUL_SERVICE_URL
    SolveRPN.SUM_SERVICE_URL=SUM_SERVICE_URL

    val route =
      path("service") {
        get {
          parameter("math".as[String]) { (math) =>
              println("OP: " + math)
              complete((StatusCodes.Accepted, SolveRPN.solve(math)+""))
          }
        }
      }
    val bindingFuture = Http().bindAndHandle(route, "0.0.0.0", 8080)

    println(s"Server online at http://localhost:8080/\nPress RETURN to stop...")
    StdIn.readLine()
  }
}