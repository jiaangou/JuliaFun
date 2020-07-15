struct Rect
  left
  top
  width
  height
end

rect1 = Rect(1, 4, 3, 3)
rect2 = Rect(0, 5, 4, 3)

function rectArea(r::Rect)
  max(r.width, 0) * max(r.height, 0)
end

function overlapArea1(rect1, rect2)
  t = max(rect1.top, rect2.top)
  l = max(rect1.left, rect2.left)
  b = min(rect1.top + rect1.height,
          rect2.top + rect2.height)
  r = min(rect1.left + rect1.width,
          rect2.left + rect2.width)
  overlap = Rect(t, l, b - t, r - l)

  return rectArea(overlap)
end

function overlapArea2(rect1, rect2)
  ys = sort([
    (rect1.top, 1),
    (rect1.top + rect1.height, 1),
    (rect2.top, 2),
    (rect2.top + rect2.height, 2)
  ])

  if ys[1][2] == ys[2][2]
    return 0
  end

  height = ys[3][1] - ys[2][1]

  xs = sort([
    (rect1.left, 1),
    (rect1.left + rect1.width, 1),
    (rect2.left, 2),
    (rect2.left + rect2.width, 2)
  ])

  if xs[1][2] == xs[2][2]
    return 0
  end

  width = xs[3][1] - xs[2][1]

  return width * height
end

println(overlapArea1(rect1, rect2))
println(overlapArea2(rect1, rect2))
