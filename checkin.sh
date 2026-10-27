
#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${GLADOS_COOKIE:-}" ]]; then
  echo "错误：未设置 GLADOS_COOKIE"
  exit 1
fi

curl --fail-with-body --silent --show-error \
  'https://glados.cloud/api/user/checkin' \
  -X POST \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H 'Origin: https://glados.cloud' \
  -H "Cookie: ${GLADOS_COOKIE}" \
  --data-raw '{"token":"glados.cloud"}' \
  --compressed

echo
echo "签到请求执行完成"
