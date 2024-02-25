class GitStackAT123 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.2.3"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.3/git-stack-cli-macos"
    sha256 "ac614b2d99d96e781b65759045ed88c715c6ce8b6b29022d5ea90e8b7ea36f46"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.3/git-stack-cli-linux"
    sha256 "d608803c7a179a3d821cc7b02f2d0e74b2574074891f03bdc5bb8fb371cb9be2"
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
