#!/bin/env bash

systemctl --user mask dunst
systemctl --user daemon-reload
systemctl --user stop dunst

