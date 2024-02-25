class GitStackAT121 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.2.1"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.1/git-stack-cli-macos"
    sha256 "280930ae74894d1524ef72ab01ad81597b453bd1fe006ea64aeeeb5c92cd711d"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.1/git-stack-cli-linux"
    sha256 "038ea48e21508655ec2515c00c64c9ad91a5ac14998db41847ebc5844fe44163"
  end

  def install
    bin.install "git-stack-cli-macos" => "git-stack" if OS.mac?
    bin.install "git-stack-cli-linux" => "git-stack" if OS.linux?
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
