
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
  -H 'Accept-Language: zh-CN,zh;q=0.9' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H 'Origin: https://glados.cloud' \
  -H 'Cookie: ${GLADOS_COOKIE}' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36' \
  --data-raw '{"token":"glados.cloud"}' \
  --compressed

echo
echo "签到请求执行完成"
