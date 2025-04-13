# Profiles

Environment-specific configuration overrides.

## To create a new profile:

1. Create a folder in `profiles/`, e.g. `myprofile/`
2. Add any of the following:
   - `env.zsh` for environment variables
   - `aliases.zsh` for shell aliases
   - `functions.zsh` (optional) for functions

3. Set the profile:

   ```sh
   echo myprofile > ~/.dot_profile
   ```
