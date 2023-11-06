prooblig2.arr
include tables
include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source 
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
kWh-wealthy-consumer-data =
  load-table: komponent, energi
    source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
  sanitize komponent using string-sanitizer
    sanitize energi using string-sanitizer
  end


distance-travelled-per-day = 50
distance-per-unit-of-fuel = 12
energy-per-unit-of-fuel = 10

car = (distance-travelled-per-day / distance-per-unit-of-fuel ) * energy-per-unit-of-fuel
#energy-per-day(50, 12, 10)



fun energi-to-number(str :: String) -> Number:
   doc: "If s is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => car
  end
where:
  energi-to-number("") is car
 energi-to-number("48") is 48
end

my-table = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

bar-chart(my-table, "komponent", "energi")

sum(my-table, "energi")
