# SYNTAX TEST "Elixir.sublime-syntax"

## Documentation comments

# NB: Check that `def` doesn't match past the newline and consumes the closing `"""`.
@doc """
Don't insert a comment between `x` and `"""`.
    iex> def x
"""
#<- punctuation.definition.string.end

@doc """
#^^^ support.attr.doc
    iex> def x
#   ^^^^^^^^^^^ markup.raw.block.elixir
#^^^ source.markdown.embedded.elixir
 \' \""" #{interpolation}
#          ^^^^^^^^^^^^^ variable.other
#        ^^^^^^^^^^^^^^^^ meta.interpolation.elixir
#   ^^ constant.character.escape.char.elixir
#^^ constant.character.escape.char.elixir
 """
#^^^ punctuation.definition.string.end

# NB: Check that defmodule doesn't match past the newline and consumes the closing `"""`.
@doc """
Don't insert a comment between `X` and `"""`.
    defmodule X
"""
#<- punctuation.definition.string.end

@doc """
    defmodule X
#   ^^^^^^^^^^^^ markup.raw.block.elixir
#^^^ source.markdown.embedded.elixir
 """m
#   ^ -storage.type.string
#^^^ punctuation.definition.string.end

@doc ~S"""
 \'\e \""" #{interpolation}
#          ^^^^^^^^^^^^^^^^ -meta.interpolation.elixir
#     ^^ constant.character.escape.char.elixir
#^^^^ -constant.character.escape
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

@doc ~S'''
#      ^^^ punctuation.definition.string.begin
#    ^^ storage.type.string
 doc
#^^^^ source.markdown.embedded.elixir
 \escape #{interpolation}
#        ^^^^^^^^^^^^^^^^ -meta.interpolation.elixir
#^^ -constant.character.escape
 \" \'''
#   ^^ constant.character.escape.char.elixir
#^^ -constant.character.escape
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

# NB: no need to support charlist heredoc.
@doc '''
 doc
#^^^^ -source.markdown.embedded.elixir
'''m
#  ^ -storage.type.string
# NB: no need to support `~s"""` which is basically `"""`.
@doc ~s"""
 doc
#^^^^ -source.markdown.embedded.elixir
"""m
#  ^ storage.type.string

@doc false
#         ^ punctuation.section.arguments.end
#    ^^^^^ constant.language
#   ^ punctuation.section.arguments.begin
#^^^ support.attr.doc
@doc(false)
#         ^ punctuation.section.arguments.end
#    ^^^^^ constant.language
#   ^ punctuation.section.arguments.begin
 (@doc false)
#           ^ punctuation.section.parens.end
#^ punctuation.section.parens.begin

@doc "doc"
#         ^ punctuation.section.arguments.end
#        ^ punctuation.definition.string.end
#     ^^^ source.markdown.embedded.elixir
#    ^ punctuation.definition.string.begin
#   ^ punctuation.section.arguments.begin
@doc("doc")
#         ^ punctuation.section.arguments.end
#        ^ punctuation.definition.string.end
#     ^^^ source.markdown.embedded.elixir
#    ^ punctuation.definition.string.begin
#   ^ punctuation.section.arguments.begin
(@doc "doc")
#      ^^^ source.markdown.embedded.elixir
[@doc "doc"]
#          ^ punctuation.section.brackets.end
#<- meta.brackets.elixir

@doc "\n\"escapes\"\n"
#                     ^ punctuation.section.arguments.end
#                    ^ punctuation.definition.string.end
#                  ^^ constant.character.escape.char
#                ^^ constant.character.escape.char
#         ^^^^^^^ source.markdown.embedded.elixir
#       ^^ constant.character.escape.char
#     ^^ constant.character.escape.char

@doc since: 1.2
#    ^^^^^^ constant.other.keyword
@doc guard: true
#           ^^^^ constant.language
#    ^^^^^^ constant.other.keyword
@doc deprecated: "Use Kernel.length/1 instead"
#    ^^^^^^^^^^^ constant.other.keyword
@doc since: "1.2.3", author: "Author"
#                             ^^^^^^ source.markdown.embedded.elixir
#                  ^ punctuation.separator.arguments.elixir
#           ^^^^^^^ meta.string.elixir
#    ^^^^^^ constant.other.keyword
@doc since: "1.2.3", color: :red, deprecated: "use f/2 instead"
#                               ^ punctuation.separator.arguments.elixir
#                           ^^^^ constant.other.symbol

@doc "Sets foreground color to `#{color}`."
#                                 ^^^^^ variable.other.elixir
#                               ^^^^^^^^ meta.interpolation.elixir

quote(do: @doc guard: false)
#                     ^^^^^ constant.language
#              ^^^^^^ constant.other.keyword
#          ^^^ support.attr.doc

@doc # comment
#    ^^^^^^^^^ comment.line
#^^^ variable.other.constant - support.attr.doc
@doc == "doc"
#       ^^^^^ -source.markdown.embedded.elixir
#    ^^ keyword.operator.comparison
#   ^ -punctuation.section.parens.begin
#^^^ variable.other.constant - support.attr.doc

@moduledoc ""
#^^^^^^^^^ support.attr.doc
@typedoc ""
#^^^^^^^ support.attr.doc
@shortdoc ""
#^^^^^^^^ support.attr.doc
