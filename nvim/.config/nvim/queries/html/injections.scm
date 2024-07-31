; extends

(
  (attribute
    (attribute_name) @attribute_name
    (quoted_attribute_value
      (attribute_value) @injection.content
    )
  )
  (#match? @attribute_name "^(x-init|x-show|x-bind|x-text|x-html|x-model|x-modelable|x-for|x-effect|x-if|x-id|x-trap|(x-on|\\@|:).*)$")
  (#set! injection.language "javascript")
)

(
  (attribute
    (attribute_name) @attribute_name
    (quoted_attribute_value
      (attribute_value) @injection.content
    )
  )
  (#eq? @attribute_name "x-data")
  (#not-match? @injection.content "f:format")
  (#set! injection.language "javascript")
)

(
  (element
    (self_closing_tag
      (tag_name) @tag_name
      (attribute
	(quoted_attribute_value
	  (attribute_value) @variable_name
	)
      )
      (attribute
	(quoted_attribute_value
	  (attribute_value) @injection.content
	)
      )
    )
  )
  (#eq? @tag_name "f:variable")
  (#match? @variable_name "[xX][dD]ata")
  (#set! injection.language "javascript")
)

