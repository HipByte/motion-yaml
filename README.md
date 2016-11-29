# motion-yaml

[![Build Status](https://travis-ci.org/HipByte/motion-yaml.svg?branch=master)](https://travis-ci.org/HipByte/motion-yaml) [![Gem Version](https://badge.fury.io/rb/motion-yaml.svg)](https://badge.fury.io/rb/motion-yaml)

motion-yaml provides methods to access "YAML Ain't Markup Language" for RubyMotion projects.

## Requirements

- RubyMotion 1.0 or greater (see http://www.rubymotion.com).

## Installation

```bash
$ sudo gem install motion-yaml
```

## Setup

1. Edit the `Rakefile` of your RubyMotion project and add the following require lines.

```ruby
require 'rubygems'
require 'motion-yaml'
```

## Methods

### YAML.dump(obj)

- Converts _obj_ to YAML.

```ruby
YAML.dump([{ 'a' => 'b' }, 'foo'])  #=> "- a: b\n- foo\n"
```

### YAML.load(string)

- Loads YAML from a _string_.

```ruby
YAML.load("- a: b\n- foo\n")  #=> [{"a"=>"b"}, "foo"]
```

### NSObject#to_yaml

- Converts _self_ to YAML.

```ruby
[{ 'a' => 'b' }, 'foo'].to_yaml  #=> "- a: b\n- foo\n"
```

## Special thanks

Special thanks for Patrick Thomson who created [yamlkit](https://github.com/patrickt/yamlkit).

## License

Copyright (c) 2013, HipByte SPRL and Contributors
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
