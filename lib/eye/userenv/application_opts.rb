Eye::Dsl::ApplicationOpts.class_eval do

  def use_user_env_from(user_indent, bash_envs='.bash_envs')
    infos     = Etc.getpwnam user_indent
    file_path = File.join(infos.dir, bash_envs)

    envs = IO.read(file_path).lines.inject({}) do |out, line|
      if result = /(?<key>\p{Word}*)=(?<value>.*)/.match(line)
        out[result['key']] = result['value']
      end

      out
    end

    env envs
  end

end
