class GitStackAt106 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.0.6"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.6/git-stack-cli-macos"
    sha256 "1db894a56918df25957ff8b3f549dd5d47aad84d1a3afabbc63e9a9b1662d6d8"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.0.6/git-stack-cli-linux"
    sha256 "7426586ea46ee8ee93f041dee1e97f6e07b3bde09fca06c95c60a2696c76cdb7"
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
