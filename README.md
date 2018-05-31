# Commit-msg1
## Instructions

- copy the file `commit-msg` to `.git/hooks/commit-msg`
- make sure your delete the sample file `.git/hooks/commit-msg.sample`
- Make commit msg executable. `chmod +x .git/hooks/commit-msg`
- Edit `commit-msg` to better fit your development branch, commit regex and error message
- Profit $$

## Shell example

```bash
curl https://gist.githubusercontent.com/pgilad/5d7e4db725a906bd7aa7/raw/feba0ca462f87a382cfbc3eddfcc529ceb9b7350/commit-msg.sh > .git/hooks/commit-msg

rm .git/hooks/commit-msg.sample

chmod +x .git/hooks/commit-msg

vim .git/hooks/commit-msg

echo "Profit $$"
```

# Commit-msg2

With this `commit-msg` git hook and your branch names have Jira reference(s), your commit messages will be automatically updated to include any missing reference(s) too.

## Installation

Place contents of this gist's [`commit-msg`](https://gist.githubusercontent.com/dberstein/dcc50e171163c3f6e0f23b2b5de5dd49/raw/5e5372ff22a872321ad1f5469a4d579c15ce498a/commit-msg) file into your checkout's `.git/hooks/commit-msg` file and make it executable.

### Bash
``` 
cd path/to/your/git/checkout \
&& install -vbm 755 <(curl -s https://gist.githubusercontent.com/dberstein/dcc50e171163c3f6e0f23b2b5de5dd49/raw/5e5372ff22a872321ad1f5469a4d579c15ce498a/commit-msg) "$(git rev-parse --git-dir)/hooks/commit-msg"
```

### Zsh
``` 
cd path/to/your/git/checkout \
&& install -vbm 755 =(curl -s https://gist.githubusercontent.com/dberstein/dcc50e171163c3f6e0f23b2b5de5dd49/raw/5e5372ff22a872321ad1f5469a4d579c15ce498a/commit-msg) "$(git rev-parse --git-dir)/hooks/commit-msg"
```

### Usage

1. Create branch whose name contains one or more Jira issues (surrounded by non-word characters, regex "\b"):
```
git checkout -b feature/WAP-123.WAP-456.FixingPProblem
... work ...
```

2. Upon commit any Jira reference *not* included in the commit message will be preprended.

For example, if you make commit with message `fixed` in this branch, full message will be `WAP-123, WAP-456, fixed`. If message was `fix for WAP-123` full message will be `WAP-456, fix for WAP-123` (only `WAP-456` was missing). If message contains *all* Jira references of branch name commit message would not be altered.


# Read
- https: / / git-scm.com /book/uz/v2/Customizing-Git-An-Example-Git-Enforced-Policy
