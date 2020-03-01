package com

object SolveRPN {

    var DIV_SERVICE_URL:String = ""
    var SUB_SERVICE_URL:String = ""
    var MUL_SERVICE_URL:String = ""
    var SUM_SERVICE_URL:String = ""

    def get(url: String) = scala.io.Source.fromURL(url).mkString

    def call(op:String,va:String,vb:String):Double = {
        val callURL = op+"?va="+va+"&vb="+vb
        println("Calling: " + callURL)
        get(callURL).toDouble
    }

    def solve(eqn:String): Double = {
        val items = eqn.split(" ")
        val accumulator = List[Double]()
        items.foldLeft(accumulator)(foldingFunction).head
    }
    def foldingFunction (stack: List[Double], a:String): List[Double] = stack match {
        case List() => a.toDouble :: stack 
        case List(_) => a.toDouble :: stack
        case x::y::ys => a match {
            case "*" => call(MUL_SERVICE_URL,x.toString,y.toString) :: ys
            case "+" => call(SUM_SERVICE_URL,x.toString,y.toString) :: ys
            case "-" => call(SUB_SERVICE_URL,x.toString,y.toString) :: ys
            case "/" => call(DIV_SERVICE_URL,x.toString,y.toString) :: ys
            case s: String => s.toDouble :: stack
        }
    }

}