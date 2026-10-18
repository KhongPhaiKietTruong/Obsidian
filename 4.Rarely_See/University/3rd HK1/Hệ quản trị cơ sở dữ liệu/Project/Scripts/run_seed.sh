#!/usr/bin/env bash
# ==============================================================================
# Script thực thi nạp dữ liệu mẫu khổng lồ massive_seed_data.sql vào SQL Server
# ==============================================================================

set -e

SA_PASSWORD=${SA_PASSWORD:-"KiettruongDEV@06"}
DB_HOST=${DB_HOST:-"localhost"}
DB_PORT=${DB_PORT:-"1433"}
DOCKER_CONTAINER=${DOCKER_CONTAINER:-"sqlserver2022"}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/create_data.sql" ]; then
    SQL_FILE="$SCRIPT_DIR/create_data.sql"
else
    SQL_FILE="$SCRIPT_DIR/massive_seed_data.sql"
fi

echo "=================================================================="
echo "    ĐANG NẠP DỮ LIỆU MẪU KHỔNG LỒ (MASSIVE SEED DATA) CHO LINUX   "
echo "=================================================================="

if command -v docker &> /dev/null && docker ps --format '{{.Names}}' | grep -q "^${DOCKER_CONTAINER}$"; then
    echo "[INFO] Đang nạp dữ liệu qua Docker Container '${DOCKER_CONTAINER}'..."
    docker exec -i "$DOCKER_CONTAINER" /opt/mssql-tools18/bin/sqlcmd \
        -S localhost -U sa -P "$SA_PASSWORD" -C \
        < "$SQL_FILE"
elif command -v sqlcmd &> /dev/null; then
    echo "[INFO] Đang nạp dữ liệu qua sqlcmd nội bộ..."
    sqlcmd -S "${DB_HOST},${DB_PORT}" -U sa -P "$SA_PASSWORD" -C -i "$SQL_FILE"
elif [ -f "/opt/mssql-tools18/bin/sqlcmd" ]; then
    /opt/mssql-tools18/bin/sqlcmd -S "${DB_HOST},${DB_PORT}" -U sa -P "$SA_PASSWORD" -C -i "$SQL_FILE"
else
    echo "[LỖI] Không tìm thấy lệnh sqlcmd và container Docker '${DOCKER_CONTAINER}' chưa bật!"
    exit 1
fi

echo "=================================================================="
echo ">>> ĐÃ HOÀN TẤT NẠP DỮ LIỆU MẪU THÀNH CÔNG! <<<"
echo "=================================================================="
