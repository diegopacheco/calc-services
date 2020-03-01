package main

import (
	"strconv"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/service/div", func(c *gin.Context) {
		va := c.Query("va")
		vb := c.Query("vb")
		vaNumber, _ := strconv.ParseFloat(va, 64)
		vbNumber, _ := strconv.ParseFloat(vb, 64)
		result := vaNumber / vbNumber
		c.JSON(200, result)
	})
	r.Run()
}
