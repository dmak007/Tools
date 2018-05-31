


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
 - Read - https: / / git-scm.com /book/uz/v2/Customizing-Git-An-Example-Git-Enforced-Policy
