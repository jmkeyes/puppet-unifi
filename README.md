# Puppet Unifi Controller Module

[![Puppet Forge](http://img.shields.io/puppetforge/v/jmkeyes/unifi.svg)](https://forge.puppetlabs.com/jmkeyes/unifi)
[![Build Status](https://travis-ci.org/jmkeyes/puppet-unifi.svg?branch=master)](https://travis-ci.org/jmkeyes/puppet-unifi)

#### Table of Contents

 1. [Overview](#overview)
 2. [Description](#description)
 3. [Todo](#todo)

## Overview

This is a Puppet module to manage and deploy a Ubiquiti UniFi controller from the vendor
APT repositories. It currently targets the latest stable release of Puppet, and should
support Debian family distributions (like the vendor).

## Description

To use this module, use either an include-like or resource-like declaration:

    # An include-like declaration for Hiera integration.
    include ::unifi

    # A resource-like declaration for manual overrides.
    class { '::unifi': }

This module is intended to work with Puppet 4.x.

## Configuration

All configuration can be handled either through Hiera or by arguments to the `unifi` class.

### UniFi Controller (using manifests)

    # Install a UniFi Controller:
    class { '::unifi': }

### UniFi Controller (using Hiera)

    # In Hiera configuration:
    classes:
      - 'unifi'

## Todo

  * Log rotation rules for logs located at `${::unifi::data_path}/logs`.
  * Custom fact for UUID written to system properties after first boot.
  * Custom configuration for known usable parameters.
