# Copyright (c) 2013, HipByte SPRL and Contributors
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

task :default => :gem

task :build do
  mkdir_p "lib/YAMLKit"
  sh "cd YAMLKit; xcodebuild -arch armv6 -arch armv7 -arch armv7s"
  sh "cd YAMLKit; xcodebuild -sdk iphonesimulator"
  sh "lipo -create YAMLKit/build/Release-iphoneos/libYAMLKit.a YAMLKit/build/Release-iphonesimulator/libYAMLKit.a -output lib/YAMLKit/libYAMLKit.a"
  sh "cp YAMLKit/src/*.h lib/YAMLKit/"
  sh "cp YAMLKit/YAMLKit_Prefix.pch lib/YAMLKit/"
end

desc "Build Gem file"
task :gem => :build do
  sh "gem build motion-yaml.gemspec"
end

desc "Clean builded files"
task :clean do
  sh "rm -rf build"
  sh "rm -rf YAMLKit/build"
  sh "rm -rf YAMLKit/.build"
  sh "rm -rf lib/YAMLKit"
  sh "rm -f motion-yaml*.gem"
end

desc "Run spec"
task :spec => :build do
  require './spec'
  Rake::Task['spec:simulator'].invoke
end