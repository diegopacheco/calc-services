package com

object SolveRPN {

    def DIV_SERVICE_URL:String = ""
    def SUB_SERVICE_URL:String = ""
    def MUL_SERVICE_URL:String = ""
    def SUM_SERVICE_URL:String = ""

    def get(url: String) = scala.io.Source.fromURL(url).mkString

    def call(String op,Double va,Double vb) = String {
        result = op match {
            case "*" => get(MUL_SERVICE_URL+"?va="+va+"&vb="+vb);
            case "+" => get(SUM_SERVICE_URL+"?va="+va+"&vb="+vb);
            case "-" => get(SUB_SERVICE_URL+"?va="+va+"&vb="+vb);
            case "/" => get(DIV_SERVICE_URL+"?va="+va+"&vb="+vb);
        }
        return Double.parseDouble(result)
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
            case "*" => call("*",x,y) :: ys
            case "+" => call("+",x,y) :: ys
            case "-" => call("-",x,y) :: ys
            case "/" => call("/",x,y) :: ys
            case s: String => s.toDouble :: stack
        }
    }
}