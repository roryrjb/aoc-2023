def process_line(line):
    parts = line.split(":")[1].split("|")
    winning = [int(s.strip()) for s in parts[0].strip().split(" ") if s]
    drawn = [int(s.strip()) for s in parts[1].strip().split(" ") if s]
    matched = [d for d in drawn if d in winning]
    return len(matched)


all_matches = {}
total = 0


def count(mylist):
    global total
    for elem in mylist:
        matches = all_matches[elem]
        if len(matches):
            total += len(matches)
        count(matches)


with open("input.txt", "r") as f:
    entry = []
    lines = [process_line(line) for line in f.readlines()]
    total += len(lines)
    for i, result in enumerate(lines):
        if result > 0:
            entry.append(i + 1)

        all_matches[i + 1] = list(range(i + 1 + 1, result + (i + 1 + 1)))

    count(entry)

print("part2", total)
