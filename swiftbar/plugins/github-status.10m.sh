#!/bin/bash
# github-status.10m.sh - Aggregate github pullrequest statuses

REPO_DIR=PUT_YOUR_REPOSITORY_PATH
GH_BIN=/opt/homebrew/bin/gh

TMP_FILE1=/tmp/github-requested-status.json
TMP_FILE2=/tmp/github-my-pullrequest-status.json

cd $REPO_DIR && $GH_BIN pr list --json number,title,url,author,isDraft,statusCheckRollup,reviewDecision,baseRefName,headRefName --search "user-review-requested:@me" > $TMP_FILE1
cd $REPO_DIR && $GH_BIN pr list --json number,title,url,author,isDraft,statusCheckRollup,reviewDecision,baseRefName,headRefName --search "author:@me" > $TMP_FILE2

# jq filter: determine icon from isDraft and checks status
JQ_CHECK_ICON='
def check_icon:
  if .isDraft then "🖋️"
  elif (.statusCheckRollup | length) == 0 then
    if .reviewDecision == "APPROVED" then "👍" else "✅" end
  elif (.statusCheckRollup | map(
    if .state then
      if .state == "SUCCESS" then "ok"
      elif .state == "PENDING" or .state == "EXPECTED" then "pending"
      else "fail"
      end
    else
      if .status != "COMPLETED" then "pending"
      elif .conclusion == "SUCCESS" or .conclusion == "NEUTRAL" or .conclusion == "SKIPPED" then "ok"
      else "fail"
      end
    end
  ) | any(. == "fail")) then "❌"
  elif (.statusCheckRollup | map(
    if .state then
      if .state == "PENDING" or .state == "EXPECTED" then "pending" else "ok" end
    else
      if .status != "COMPLETED" then "pending" else "ok" end
    end
  ) | any(. == "pending")) then "🔄"
  elif .reviewDecision == "APPROVED" then "👍"
  else "✅"
  end;
'

# jq filter: flat list (for review-requested)
JQ_FLAT="${JQ_CHECK_ICON}"'
.[] | "\(check_icon) #\(.number) \(.title) (\(.author.name)) | href=\(.url)"
'

# Display
pr_cnt=$(cat $TMP_FILE1 | jq '[.[] | select(.isDraft | not)] | length')
echo ":arrow.triangle.pull:${pr_cnt}"

# Dropdown menu
echo "---"
echo "要レビュー"
cat $TMP_FILE1 | jq -r "$JQ_FLAT"
echo "作業中"
cat $TMP_FILE2 | jq -r "$JQ_FLAT"
