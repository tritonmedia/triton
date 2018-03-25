#!/usr/bin/env bash
#
# Hit's events locally with a "fake" card.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

WEBHOOK_JSON=$(cat "${DIR}/webhook.json")
curl -X POST -H "Content-Type: application/json" -d "${WEBHOOK_JSON}" http://127.0.0.1:3401/trello/webhook
