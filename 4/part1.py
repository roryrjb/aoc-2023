total = 0

with open("input.txt", "r") as f:
    for line in f.readlines():
        subtotal = 0
        parts = line.split(":")[1].split("|")
        winning = [int(s.strip()) for s in parts[0].strip().split(" ") if s]
        drawn = [int(s.strip()) for s in parts[1].strip().split(" ") if s]
        matched = [d for d in drawn if d in winning]

        if len(matched) > 0:
            subtotal = 1

        for n in range(1, len(matched)):
            subtotal *= 2
        total += subtotal

print("part1", total)
