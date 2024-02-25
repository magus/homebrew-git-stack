class GitStackAT124 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "1.2.4"

  if OS.mac?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.4/git-stack-cli-macos"
    sha256 "f06e0e60961aca39aee48d5aabb80753a9df8bdaafd2e6b63f35974f65bee5f1"
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/1.2.4/git-stack-cli-linux"
    sha256 "86f102ca9a52194cdc4a16fd3e19324f594da9a793ce4494b821ee2f2088953d"
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
