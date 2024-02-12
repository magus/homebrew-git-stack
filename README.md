# homebrew-git-stack

> homebrew formula for **[git-stack](https://github.com/magus/git-stack-cli)**

## install

```bash
brew tap magus/git-stack
brew install git-stack
```

## Preparing for `homebrew/core`

Use the **[Formula Cookbook](https://docs.brew.sh/Formula-Cookbook#basic-instructions)** to generate a local formula for testing.
Most of the work is done under **[`Formula/git-stack.core.rb`](Forumla/git-stack.core.rb)** using the **[`templates/git-stack.core.rb.template`](templates/git-stack.core.rb.template)**.

The formula are build as a part of the publish process in **[`magus/git-stack-cli`](https://github.com/magus/git-stack-cli)**.

1. Run a command like below to create the local formula you will use to test and submit to `homebrew/core`

   ```bash
   brew create https://registry.npmjs.org/git-stack-cli/-/git-stack-cli-1.0.3.tgz --node
   ```

1. Copy the contents of **[`Formula/git-stack.core.rb`](Forumla/git-stack.core.rb)** into the generated local formula

1. Use the command below to test the formula

   ```bash
   brew test git-stack
   ```

1. Use the command below to audit the formula

   ```bash
   brew audit --new git-stack
   ```

## Why `brew tap` and not `homebrew/core`?

In order to submit to core the Github repo needs to be notable enough 75+ stars, 30+ forks, 30+ watchers, etc.
Until that time it is simpler to just do a tap and install binaries directly, bypassing `homebrew/core`.
When running `brew audit --new git-stack` we receive the error below

```bash
❯ brew audit --new git-stack
git-stack
  * GitHub repository not notable enough (<30 forks, <30 watchers and <75 stars)
Error: 1 problem in 1 formula detected.
```

> https://docs.brew.sh/Formula-Cookbook#audit-the-formula

`git-stack.core.rb.template` does the full build of the standalone executable for the appropriate target platform.
However this is an expensive operation and takes a long time since it requires fetching the `node` binary to bundle alongside `git-stack`.
In `homebrew/core` this would generate a `bottle` for all the platforms and not really be an issue since most installs
would use the prebuilt `bottle`.

> https://docs.brew.sh/Bottles

`git-stack.tap.rb.template` on the other hand, leverages prebuilt binaries attached to Github.
This allows us to build the binaries once time for all targets and download them directly in the formula.
This gets around the otherwise prohibitively long install time.

## setup

```bash
git submodule add https://github.com/magus/homebrew-git-stack-cli homebrew
git submodule init
git submodule update
git add .gitmodules homebrew
git commit
git push
```

after cloning

```bash
git submodule update --init --recursive
```
