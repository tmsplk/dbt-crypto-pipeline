{% macro dynamic_union(table_names) %}
  {% if table_names | length == 0 %}
    {{ exceptions.raise_compiler_error("No tables provided for dynamic union.") }}
  {% endif %}

  {% set unioned_query %}
    {% for table_name in table_names %}
      SELECT * FROM "{{ table_name }}"
      {% if not loop.last %} UNION ALL {% endif %}
    {% endfor %}
  {% endset %}

  {{ return(unioned_query) }}
{% endmacro %}
