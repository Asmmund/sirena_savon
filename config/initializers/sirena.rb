SIRENA = YAML.load_file("#{Rails.root}/config/sirena.yml").symbolize_keys
SIRENA[:auth].symbolize_keys!