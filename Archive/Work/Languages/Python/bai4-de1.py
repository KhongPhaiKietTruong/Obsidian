def find_groups_in_line(arr, line_type, index):
    """
    Tìm tất cả các nhóm con liên tiếp KHÔNG TRÙNG GIÁ TRỊ trong 1 hàng hoặc 1 cột.
    line_type: "row" hoặc "col"
    index: số thứ tự hàng/cột
    """
    groups = []
    seen = set()
    start = 0

    for i, val in enumerate(arr):
        if val in seen:
            # kết thúc nhóm cũ
            groups.append({
                "type": line_type,
                "start": (index, start) if line_type == "row" else (start, index),
                "end": (index, i - 1) if line_type == "row" else (i - 1, index),
                "elements": arr[start:i]
            })
            # bắt đầu nhóm mới
            seen = {val}
            start = i
        else:
            seen.add(val)

    # nhóm cuối cùng
    groups.append({
        "type": line_type,
        "start": (index, start) if line_type == "row" else (start, index),
        "end": (index, len(arr) - 1) if line_type == "row" else (len(arr) - 1, index),
        "elements": arr[start:]
    })

    return groups


def solve():
    n = int(input("Nhập n: "))
    m = int(input("Nhập m: "))

    print("Nhập ma trận:")
    A = [list(map(int, input().split())) for _ in range(n)]

    # 1. Tìm tất cả nhóm hàng và nhóm cột
    groups = []

    # nhóm hàng
    for r in range(n):
        groups += find_groups_in_line(A[r], "row", r)

    # nhóm cột
    for c in range(m):
        col = [A[r][c] for r in range(n)]
        groups += find_groups_in_line(col, "col", c)

    # 2. Tính tổng và độ dài nhóm
    for g in groups:
        g["length"] = len(g["elements"])
        g["total"] = sum(g["elements"])

    # 3. Tìm nhóm tốt nhất
    best = max(groups, key=lambda g: (g["length"], g["total"]))

    # 4. In kết quả
    print("\n--- KẾT QUẢ ---")
    print("Loại nhóm:", "Hàng" if best["type"] == "row" else "Cột")
    print("Vị trí bắt đầu:", best["start"])
    print("Vị trí kết thúc:", best["end"])
    print("Độ dài nhóm:", best["length"])
    print("Tổng giá trị:", best["total"])
    print("Các phần tử:", best["elements"])

solve()