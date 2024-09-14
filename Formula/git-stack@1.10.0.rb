class GitStackAT1100 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.10.0"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.10.0/git-stack-cli-macos"
    sha256 "8d4cb3e94c25a744fdb5df9a0ef5394a9b9336d20443a514d8990f50875ae46e"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.10.0/git-stack-cli-linux"
    sha256 "36542d07a2a7657401072e640afbeae71833a4c3c0e22cfc53b1b33650ed9ce0"
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
