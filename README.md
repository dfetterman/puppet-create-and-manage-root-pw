## Synopsis

A script that consumes a list of clear text passwords and hostnames, hashes them, eyaml encrypts them, and output hiera eyaml formatted data that can simply be added to a secure.yaml file.

Also included is a super simple Puppet module that can read eyaml encrypted secrets from hiera based on factor hostname and then apply them to a specific user account.

## Use Case

You want to quickly bulk reset a user's password across Puppet managed Linux hosts that were not previously using Puppet to manage user credentials. You also want the password to be unique on each host.

## Notes

- Please test this before running in production
- You must run the .sh script from within a directory that has permissions to run an eyamlencrypt command.
- If you work out an automated way to test and verify that everything works, please let me know.


