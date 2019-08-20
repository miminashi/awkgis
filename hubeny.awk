#!/usr/bin/env awk -f

#
# ヒュベニの公式を用いて
#
# 参考:
#   - https://www.trail-note.net/tech/calc_distance/
#   - https://qiita.com/chiyoyo/items/b10bd3864f3ce5c56291
#

function pi() {
  return atan2(0, -1)
}

function deg_to_rad(deg) {
  return pi() * deg / 180
}

function distance(lat_1, lon_1, lat_2, lon_2) {
  # 赤道半径
  rx = 6378137.000

  # 極半径
  ry = 6356752.314245

  # 離心率^2
  e2 = (rx^2 - ry^2) / rx^2

  # 緯度経度をラジアンに変換
  rad_lat_1 = deg_to_rad(lat_1)
  rad_lon_1 = deg_to_rad(lon_1)
  rad_lat_2 = deg_to_rad(lat_2)
  rad_lon_2 = deg_to_rad(lon_2)

  # 緯度差
  dy = rad_lat_1 - rad_lat_2

  # 経度差
  dx = rad_lon_1 - rad_lon_2

  # 平均緯度
  p = (rad_lat_1 + rad_lat_2) / 2

  # W^2
  w2 = 1 - e2 * sin(p) * sin(p)

  # 子午線曲率半径
  m = (rx * (1 - e2)) / (w2 * sqrt(w2))

  # 卯酉線曲線半径
  n = rx / sqrt(w2)

  # 2点間の距離
  d = sqrt((dy * m) ^ 2 + (dx * n * cos(p)) ^ 2)

  return d
}

{
  printf("%.10f\n", distance($1, $2, $3, $4))
}

