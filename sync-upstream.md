# upstream (NvChad/starter) の変更を取り込む手順

## 1. 最新を取得

```bash
git fetch https://github.com/NvChad/starter.git main
```

## 2. 差分を確認

```bash
# コミットの差分
git log --oneline --left-right HEAD...FETCH_HEAD

# ファイルの差分
git diff --stat HEAD..FETCH_HEAD

# 詳細な差分を見たい場合
git diff HEAD..FETCH_HEAD
```

## 3. 専用ブランチを作成

```bash
git switch -c sync-starter
```

## 4. マージ

```bash
git merge FETCH_HEAD
```

### コンフリクトが発生した場合

```bash
# 手動で解決後
git add .
git commit

# 中断する場合
git merge --abort
git switch main
git branch -d sync-starter
```

## 5. 確認後 main に統合

```bash
git switch main
git merge sync-starter
git branch -d sync-starter
```
