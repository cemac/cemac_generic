#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Backends.py
.. module:: Backends
    :platform: Unix
    :synopis:
.. moduleauther: CEMAC (UoL) - Helen
.. description: Backend catch example
.. CEMAC_generic:
   https://github.com/cemac/CEMAC_generic
"""
import matplotlib as mpl
import sys
# University System python may be broken
# If some one insists on using it...
backend = mpl.get_backend()
if backend == 'Qt4Agg' and sys.version_info[0] == 2:
    # Fix the backend
    print('Fixing Backend ....')
    print('Please consider using anaconda python')  # Personal Preference
    mpl.use('Agg')
# DO NOT MOVE ABOVE BACKEND FIX
import matplotlib.pyplot as plt  # KEEP ME HERE!!!
################################
