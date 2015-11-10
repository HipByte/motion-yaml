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
  sh "cd YAMLKit; xcodebuild -target YAMLKit_iOS -arch armv7 -arch armv7s -arch arm64"
  sh "cd YAMLKit; xcodebuild -target YAMLKit_iOS -sdk iphonesimulator -arch i386 -arch x86_64"
  sh "cd YAMLKit; xcodebuild -target YAMLKit_tvOS -arch arm64"
  sh "cd YAMLKit; xcodebuild -target YAMLKit_tvOS -sdk appletvsimulator -arch x86_64"
  sh "cd YAMLKit; xcodebuild -target YAMLKit_OSX -arch i386 -arch x86_64"
  sh "lipo -create YAMLKit/build/Release-iphoneos/libYAMLKit_iOS.a YAMLKit/build/Release-iphonesimulator/libYAMLKit_iOS.a -output lib/YAMLKit/libYAMLKit_iOS.a"
  sh "lipo -create YAMLKit/build/Release-appletvos/libYAMLKit_tvOS.a YAMLKit/build/Release-appletvsimulator/libYAMLKit_tvOS.a -output lib/YAMLKit/libYAMLKit_tvOS.a"
  sh "cp YAMLKit/build/Release/libYAMLKit_OSX.a lib/YAMLKit/"
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

namespace :spec do
  #--------------
  # for simulator
  #--------------
  task :simulator do
    Rake::Task['clean'].invoke
    Rake::Task['build'].invoke

    require './spec'
    Rake::Task['spec:simulator'].invoke
  end

  desc "Run the test/spec suite on iOS simulator"
  task :"simulator:ios" do
    sh "rake spec:simulator PLATFORM=ios"
  end

  desc "Run the test/spec suite with i386 on iOS simulator"
  task :"simulator:ios:i386" do
    sh "rake spec:simulator PLATFORM=ios ARCH=i386"
  end

  desc "Run the test/spec suite with x86_64 on iOS simulator"
  task :"simulator:ios:x86_64" do
    sh "rake spec:simulator PLATFORM=ios ARCH=x86_64"
  end

  desc "Run the test/spec suite with all archs on iOS simulator"
  task :"simulator:ios:all" do
    sh "rake spec:simulator PLATFORM=ios ARCH=i386"
    sh "rake spec:simulator PLATFORM=ios ARCH=x86_64"
  end

  desc "Run the test/spec suite on tvOS simulator"
  task :"simulator:tvOS" do
    sh "rake spec:simulator PLATFORM=tvos"
  end

  #--------------
  # for device
  #--------------
  desc "Run the test/spec suite on iOS device"
  task :device do
    Rake::Task['clean'].invoke
    Rake::Task['build'].invoke

    require './spec'
    Rake::Task['spec:device'].invoke
  end

  desc "Run the test/spec suite with armv7 on iOS device"
  task :"device:ios:armv7" do
    sh "rake spec:device PLATFORM=ios ARCH=armv7"
  end

  desc "Run the test/spec suite with arm64 on iOS device"
  task :"device:ios:arm64" do
    sh "rake spec:device PLATFORM=ios ARCH=arm64"
  end

  desc "Run the test/spec suite on tvOS device"
  task :"device:tvos" do
    sh "rake spec:device PLATFORM=tvos"
  end

  #--------------
  # for OS X
  #--------------
  task :osx do
    Rake::Task['clean'].invoke
    Rake::Task['build'].invoke

    require './spec'
    Rake::Task['spec'].invoke
  end

  desc "Run the test/spec suite with i386 on OS X"
  task :"osx:i386" do
    sh "rake spec PLATFORM=osx ARCH=i386"
  end

  desc "Run the test/spec suite with x86_64 on OS X"
  task :"osx:x86_64" do
    sh "rake spec PLATFORM=osx ARCH=x86_64"
  end

  desc "Run the test/spec suite with all archs on OS X"
  task :"osx:all" do
    sh "rake spec PLATFORM=osx ARCH=i386"
    sh "rake spec PLATFORM=osx ARCH=x86_64"
  end
end

desc "Same as 'spec:simulator'"
task :spec => :"spec:simulator"
