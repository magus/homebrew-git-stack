class GitStackAT212 < Formula
  desc "Stacked diffs for git"
  homepage "https://github.com/magus/git-stack-cli"
  version "2.1.2"

  if OS.mac?
    if Hardware::CPU.arm? || Hardware::CPU.in_rosetta2?
      url "https://github.com/magus/git-stack-cli/releases/download/2.1.2/git-stack-bun-darwin-arm64.zip"
      sha256 "b91336eb5a91cd489d2a0fe03a93b2c23f283eb9ab9111de902bb0974c5dd671"

      def filename
        "git-stack-bun-darwin-arm64.zip"
      end
    else
      url "https://github.com/magus/git-stack-cli/releases/download/2.1.2/git-stack-bun-darwin-x64.zip"
      sha256 "337dd4856883e4292f880ed60e2483ac220c23f04eb3d8cafb235fd009b73565"

      def filename
        "git-stack-bun-darwin-x64.zip"
      end
    end
  elsif OS.linux?
    url "https://github.com/magus/git-stack-cli/releases/download/2.1.2/git-stack-bun-linux-x64.zip"
    sha256 "e183469d2d201de63b08f04ec0d3fb830733cdc4386e84fe17e0aa8c19cfd526"

    def filename
      "git-stack-bun-linux-x64.zip"
    end
  else
    odie "Unsupported platform. Please submit a bug report here: https://github.com/magus/git-stack-cli/issues\n#{OS.report}"
  end

  # official Github CLI
  # https://cli.github.com/
  depends_on "gh"

  # git revise for faster, in-memory rebasing
  # https://github.com/mystor/git-revise
  depends_on "git-revise"

  def install
    binary_name = filename.sub(/\.zip$/, "")
    bin.install binary_name => "git-stack"
  end

  test do
    assert_match version, shell_output("#{bin}/git-stack --version")
    assert_match "Must be run from within a git repository.", shell_output("#{bin}/git-stack 2>&1", 9)
  end
end
