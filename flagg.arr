flagg.arr
fun draw-nordic-flag(bakgrunn-horisontalt, bakgrunn-vertikalt, stor-stripe, liten-stripe, farge-bakgrunn, stor-farge, liten-farge) -> Image:
  
  bakgrunn = rectangle(bakgrunn-horisontalt, bakgrunn-vertikalt, "solid", farge-bakgrunn)
  stor-stripe-horisontalt = rectangle(bakgrunn-horisontalt, stor-stripe, "solid", stor-farge)
  stor-stripe-vertikalt = rectangle(stor-stripe, bakgrunn-vertikalt, "solid", stor-farge)
  liten-stripe-horisontalt = rectangle(bakgrunn-horisontalt, liten-stripe, "solid", liten-farge)
  liten-stripe-vertikalt = rectangle(liten-stripe, bakgrunn-vertikalt, "solid", liten-farge)
  
  frame(overlay-xy(liten-stripe-vertikalt, (((bakgrunn-vertikalt - stor-stripe) / 2) + (stor-stripe / 4)) * -1,0, overlay-align("middle", "middle", liten-stripe-horisontalt, overlay-xy(stor-stripe-vertikalt,((bakgrunn-vertikalt - stor-stripe) / 2) * -1,0, overlay(stor-stripe-horisontalt, bakgrunn)))))
  
end
 
draw-nordic-flag(220, 160, 40, 20, "crimson", "white", "dark-blue")
draw-nordic-flag(220, 160, 40, 20, "white", "blue", "red")
draw-nordic-flag(250, 180, 40, 20, "blue", "white", "red")
draw-nordic-flag(160, 100, 20, 0, "blue", "yellow", "yellow")
draw-nordic-flag(370, 200, 40, 0, "red", "white", "white")
draw-nordic-flag(180, 110, 30, 0, "white", "blue", "blue")
