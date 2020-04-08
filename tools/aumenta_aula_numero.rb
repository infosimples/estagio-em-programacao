# ruby tools/aumenta_aula_numero.rb _aulas/02 7

# O script é útil para quando é necessário incluir uma aula no meio de um módulo
# existente.

require 'yaml'
require 'fileutils'

AULA_DIR = ARGV[0]
START = ARGV[1].to_i

Dir.glob("#{AULA_DIR}/*.md").each do |path|
  numero = path.split('/').last.split('_').first.to_i
  yaml = YAML.load_file(path)
  fail "#{path} tem numero inconsistente" if numero != yaml['numero']
  next if numero < START
  content = File.read(path)
  content.gsub!(/\nnumero\:[\s0-9]+/, "\nnumero: #{numero + 1}\n")
  title = yaml['title'].gsub(/\A[\s0-9]+.[0-9]+/, yaml['modulo'].to_s + '.' + (numero + 1).to_s)
  content.gsub!(yaml['title'], title)
  File.open(path, 'w') { |f| f.write content }
  new_path = path.split('/')[0..-2]
  new_path << path.split('/').last.gsub(/\A[\s0-9]+/, (numero + 1).to_s.rjust(2, '0'))
  new_path = new_path.join('/')
  FileUtils.mv(path, new_path)
end
