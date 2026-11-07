#!/usr/bin/env bash
# Generates themes/4rest.json: one family, three appearance variants (blurred, transparent, opaque).
set -euo pipefail

out=${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)/themes/4rest.json}
mkdir -p "$(dirname "$out")"

jq -n '
  def g100: "#f3f6f1"; def g200: "#dfe6dc"; def g400: "#7d8a79";
  def g500: "#4b5648"; def g600: "#262d25"; def g700: "#1a201a"; def g900: "#080a08";
  def G100: "#a6f3c0"; def G200: "#1ed760"; def G400: "#17944a"; def G500: "#11703a";
  def G600: "#0c5229"; def G700: "#08391c";
  def c100: "#a7eadb"; def c200: "#6fd1b8"; def c300: "#4fb39a"; def c400: "#3c917c"; def c700: "#13382f";
  def b100: "#c4dcf3"; def b200: "#93bde6"; def b400: "#5d88b2"; def b700: "#20374d";
  def p100: "#e1f2b0"; def p200: "#bfdf7a"; def p400: "#83a149";
  def o100: "#f6dfbf"; def o200: "#e6b984"; def o400: "#ae7f4f"; def o700: "#49321c";
  def r100: "#ffa3a3"; def r200: "#f07a7a"; def r400: "#b24a4f"; def r700: "#4a1a20";
  def added: "#0d2a18"; def removed: "#2e1418";

  def base: {
    accents: [G200, c200, o200, b200, p200, r200, G100],
    background: (g700 + "dd"),
    border: (g600 + "dd"),
    "border.disabled": (g600 + "dd"),
    "border.focused": G400,
    "border.selected": G400,
    "border.transparent": null,
    "border.variant": g600,
    conflict: o200, "conflict.background": (o700 + "dd"), "conflict.border": (o700 + "dd"),
    created: G200, "created.background": (added + "dd"), "created.border": (added + "dd"),
    deleted: r200, "deleted.background": (removed + "dd"), "deleted.border": (removed + "dd"),
    "drop_target.background": (G600 + "dd"),
    "editor.active_line.background": (g600 + "dd"),
    "editor.active_line_number": G200,
    "editor.active_wrap_guide": (g400 + "dd"),
    "editor.background": (g700 + "00"),
    "editor.document_highlight.bracket_background": (g500 + "dd"),
    "editor.document_highlight.read_background": (g600 + "dd"),
    "editor.document_highlight.write_background": (r700 + "dd"),
    "editor.foreground": g200,
    "editor.gutter.background": (g700 + "00"),
    "editor.highlighted_line.background": (g600 + "dd"),
    "editor.indent_guide": (g600 + "dd"),
    "editor.indent_guide_active": (g500 + "dd"),
    "editor.invisible": (g500 + "dd"),
    "editor.line_number": g400,
    "editor.subheader.background": (g600 + "dd"),
    "editor.wrap_guide": (g500 + "dd"),
    "element.active": (g500 + "dd"),
    "element.background": g700,
    "element.disabled": g600,
    "element.hover": (g500 + "b0"),
    "element.selected": (g500 + "dd"),
    "elevated_surface.background": g600,
    error: r200, "error.background": (removed + "dd"), "error.border": (removed + "dd"),
    "ghost_element.active": (g500 + "dd"),
    "ghost_element.background": (g700 + "00"),
    "ghost_element.disabled": (g700 + "00"),
    "ghost_element.hover": (g500 + "b0"),
    "ghost_element.selected": (g500 + "dd"),
    hidden: g400, "hidden.background": (g600 + "dd"), "hidden.border": (g600 + "dd"),
    hint: c100, "hint.background": (c700 + "dd"), "hint.border": (c700 + "dd"),
    icon: g200, "icon.accent": G200, "icon.disabled": g400, "icon.muted": g400, "icon.placeholder": g400,
    ignored: (g400 + "b0"), "ignored.background": (g600 + "dd"), "ignored.border": (g600 + "dd"),
    info: b200, "info.background": (G700 + "dd"), "info.border": (G600 + "dd"),
    "link_text.hover": c200,
    modified: c200, "modified.background": (c700 + "dd"), "modified.border": (c700 + "dd"),
    "pane.focused_border": G200,
    "pane_group.border": null,
    "panel.background": (g700 + "00"),
    "panel.focused_border": G200,
    "panel.indent_guide": (g600 + "dd"),
    "panel.indent_guide_active": (g500 + "dd"),
    "panel.indent_guide_hover": (g500 + "dd"),
    players: [{ background: G200, cursor: G200, selection: (G500 + "dd") }],
    predictive: c300, "predictive.background": (g600 + "dd"), "predictive.border": (g600 + "dd"),
    renamed: b200, "renamed.background": (b700 + "dd"), "renamed.border": (b700 + "dd"),
    "scrollbar.thumb.background": (g500 + "dd"),
    "scrollbar.thumb.border": (g500 + "dd"),
    "scrollbar.thumb.hover_background": (g400 + "dd"),
    "scrollbar.track.background": (g700 + "00"),
    "scrollbar.track.border": (g700 + "00"),
    "search.match_background": (G700 + "dd"),
    "status_bar.background": (g700 + "dd"),
    success: G200, "success.background": (added + "dd"), "success.border": (added + "dd"),
    "surface.background": (g600 + "dd"),
    syntax: {
      boolean: { color: o200 },
      comment: { color: g400 },
      "comment.doc": { color: g400 },
      constant: { color: g200 },
      "constant.builtin": { color: o200 },
      constructor: { color: c200 },
      emphasis: { color: o100, font_style: "italic" },
      "emphasis.strong": { color: G100, font_weight: 600 },
      enum: { color: o100 },
      function: { color: c200 },
      keyword: { color: G200 },
      link_text: { color: c100 },
      link_uri: { color: c200 },
      number: { color: o200 },
      operator: { color: c300 },
      primary: { color: g200 },
      punctuation: { color: g200 },
      property: { color: c100 },
      string: { color: p200 },
      tag: { color: G200 },
      "text.literal": { color: p200 },
      title: { color: G200 },
      type: { color: o100 },
      variable: { color: g200 }
    },
    "tab.active_background": (g600 + "dd"),
    "tab.inactive_background": (g700 + "00"),
    "tab_bar.background": (g700 + "00"),
    "terminal.ansi.background": g700,
    "terminal.ansi.black": g900,
    "terminal.ansi.blue": b200,
    "terminal.ansi.bright_black": g400,
    "terminal.ansi.bright_blue": b100,
    "terminal.ansi.bright_cyan": c100,
    "terminal.ansi.bright_green": G100,
    "terminal.ansi.bright_magenta": p100,
    "terminal.ansi.bright_red": r100,
    "terminal.ansi.bright_white": g100,
    "terminal.ansi.bright_yellow": o100,
    "terminal.ansi.cyan": c200,
    "terminal.ansi.dim_black": g600,
    "terminal.ansi.dim_blue": b400,
    "terminal.ansi.dim_cyan": c400,
    "terminal.ansi.dim_green": G400,
    "terminal.ansi.dim_magenta": p400,
    "terminal.ansi.dim_red": r400,
    "terminal.ansi.dim_white": g400,
    "terminal.ansi.dim_yellow": o400,
    "terminal.ansi.green": G200,
    "terminal.ansi.magenta": p200,
    "terminal.ansi.red": r200,
    "terminal.ansi.white": g200,
    "terminal.ansi.yellow": o200,
    "terminal.background": (g700 + "00"),
    "terminal.bright_foreground": g100,
    "terminal.dim_foreground": g400,
    "terminal.foreground": g200,
    text: g200, "text.accent": G200, "text.disabled": g400, "text.muted": g400, "text.placeholder": g400,
    "title_bar.background": (g700 + "dd"),
    "title_bar.inactive_background": (g700 + "dd"),
    "toolbar.background": (g700 + "00"),
    unreachable: g400, "unreachable.background": (g600 + "dd"), "unreachable.border": (g600 + "dd"),
    warning: o200, "warning.background": (o700 + "dd"), "warning.border": (o700 + "dd")
  };

  def variant(name; appearance):
    base + { "background.appearance": appearance } |
    { name: name, appearance: "dark", style: . };

  def solid:
    walk(if type == "string" and test("^#[0-9a-f]{8}$") then .[0:7] else . end);

  {
    "$schema": "https://zed.dev/schema/themes/v0.2.0.json",
    author: "aveok4now",
    name: "4rest",
    themes: [
      variant("4rest Dark"; "blurred"),
      variant("4rest Dark Transparent"; "transparent"),
      ((base + { "background.appearance": "opaque" }) | solid
        | { name: "4rest Dark Opaque", appearance: "dark", style: . })
    ]
  }
' > "$out"

echo "written: $out"
