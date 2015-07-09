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

class YAMLKitScanner
  # http://yaml.org/type/float.html
  FLOAT = /^(?:[-+]?([0-9][0-9_,]*)?\.[0-9]*([eE][-+][0-9]+)?(?# base 10)
            |[-+]?[0-9][0-9_,]*(:[0-5]?[0-9])+\.[0-9_]*(?# base 60)
            |[-+]?\.(inf|Inf|INF)(?# infinity)
            |\.(nan|NaN|NAN)(?# not a number))$/x

  # http://yaml.org/type/int.html
  INTEGER = /^(?:[-+]?0b[0-1_]+          (?# base 2)
                |[-+]?0[0-7_]+           (?# base 8)
                |[-+]?(?:0|[1-9][0-9_]*) (?# base 10)
                |[-+]?0x[0-9a-fA-F_]+    (?# base 16))$/x

  # Tokenize string returning the Ruby object
  # NOTE: This method will be called from Objective-C.
  def self.tokenize(string)
    return nil if string.empty?

    case string
    when /^\+?\.inf$/i
      Float::INFINITY
    when /^-\.inf$/i
      -Float::INFINITY
    when /^\.nan$/i
      Float::NAN
    when /^:(.*)/
      string = $1
      if string =~ /^["'](.+)["']$/
        string = $1
      end
      string.to_sym
    when INTEGER
      Integer(string.gsub(/_/, ''))
    when FLOAT
      Float(string.gsub(/_/, ''))
    when /^(yes|y|true|on)$/i
      true
    when /^(no|n|false|off)$/i
      false
    else
      nil
    end
  end
end