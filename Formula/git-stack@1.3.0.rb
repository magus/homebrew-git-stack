class GitStackAT130 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.3.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.0/git-stack-cli-macos"
    sha256 "b499e862bb9ddedcf3dc299e80456eeda459e6e28477bc8b6053ba1e971fd940"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.3.0/git-stack-cli-linux"
    sha256 "93591181738b9dd6293656bf1335a35d7f801337de8c16fb5ac8d5d4034b0fde"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
