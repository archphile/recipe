I
Name:   akkordion-iqdacplus
Info:   Configures the Digital Dreamtime Akkordion Music Player (based on the
        OEM IQAudIO DAC+ or DAC Zero module).
Load:   dtoverlay=akkordion-iqdacplus,<param>=<val>
Params: 24db_digital_gain       Allow gain to be applied via the PCM512x codec
                                Digital volume control. Enable with
                                dtoverlay=akkordion-iqdacplus,24db_digital_gain
                                (The default behaviour is that the Digital
                                volume control is limited to a maximum of
                                0dB. ie. it can attenuate but not provide
                                gain. For most users, this will be desired
                                as it will prevent clipping. By appending
                                the 24db_digital_gain parameter, the Digital
                                volume control will allow up to 24dB of
                                gain. If this parameter is enabled, it is the
                                responsibility of the user to ensure that
                                the Digital volume control is set to a value
                                that does not result in clipping/distortion!)


Name:   allo-boss-dac-pcm512x-audio
Info:   Configures the Allo Boss DAC audio cards.
Load:   dtoverlay=allo-boss-dac-pcm512x-audio,<param>
Params: 24db_digital_gain       Allow gain to be applied via the PCM512x codec
                                Digital volume control. Enable with
                                "dtoverlay=allo-boss-dac-pcm512x-audio,
                                24db_digital_gain"
                                (The default behaviour is that the Digital
                                volume control is limited to a maximum of
                                0dB. ie. it can attenuate but not provide
                                gain. For most users, this will be desired
                                as it will prevent clipping. By appending
                                the 24db_digital_gain parameter, the Digital
                                volume control will allow up to 24dB of
                                gain. If this parameter is enabled, it is the
                                responsibility of the user to ensure that
                                the Digital volume control is set to a value
                                that does not result in clipping/distortion!)
        slave                   Force Boss DAC into slave mode, using Pi a
                                master for bit clock and frame clock. Enable
                                with "dtoverlay=allo-boss-dac-pcm512x-audio,
                                slave"


Name:   allo-digione
Info:   Configures the Allo Digione audio card
Load:   dtoverlay=allo-digione
Params: <None>


Name:   allo-piano-dac-pcm512x-audio
Info:   Configures the Allo Piano DAC (2.0/2.1) audio cards.
        (NB. This initial support is for 2.0 channel audio ONLY! ie. stereo.
        The subwoofer outputs on the Piano 2.1 are not currently supported!)
Load:   dtoverlay=allo-piano-dac-pcm512x-audio,<param>
Params: 24db_digital_gain       Allow gain to be applied via the PCM512x codec
                                Digital volume control.
                                (The default behaviour is that the Digital
                                volume control is limited to a maximum of
                                0dB. ie. it can attenuate but not provide
                                gain. For most users, this will be desired
                                as it will prevent clipping. By appending
                                the 24db_digital_gain parameter, the Digital
                                volume control will allow up to 24dB of
                                gain. If this parameter is enabled, it is the
                                responsibility of the user to ensure that
                                the Digital volume control is set to a value
                                that does not result in clipping/distortion!)


Name:   allo-piano-dac-plus-pcm512x-audio
Info:   Configures the Allo Piano DAC (2.1) audio cards.
Load:   dtoverlay=allo-piano-dac-plus-pcm512x-audio,<param>
Params: 24db_digital_gain       Allow gain to be applied via the PCM512x codec
                                Digital volume control.
                                (The default behaviour is that the Digital
                                volume control is limited to a maximum of
                                0dB. ie. it can attenuate but not provide
                                gain. For most users, this will be desired
                                as it will prevent clipping. By appending
                                the 24db_digital_gain parameter, the Digital
                                volume control will allow up to 24dB of
                                gain. If this parameter is enabled, it is the
                                responsibility of the user to ensure that
                                the Digital volume control is set to a value
                                that does not result in clipping/distortion!)
        glb_mclk                This option is only with Kali board. If enabled,
                                MCLK for Kali is used and PLL is disabled for
                                better voice quality. (default Off)



Name:   dionaudio-loco
Info:   Configures the Dion Audio LOCO DAC-AMP
Load:   dtoverlay=dionaudio-loco
Params: <None>


Name:   dionaudio-loco-v2
Info:   Configures the Dion Audio LOCO-V2 DAC-AMP
Load:   dtoverlay=dionaudio-loco-v2,<param>=<val>
Params: 24db_digital_gain       Allow gain to be applied via the PCM512x codec
                                Digital volume control. Enable with
                                "dtoverlay=hifiberry-dacplus,24db_digital_gain"
                                (The default behaviour is that the Digital
                                volume control is limited to a maximum of
                                0dB. ie. it can attenuate but not provide
                                gain. For most users, this will be desired
                                as it will prevent clipping. By appending
                                the 24dB_digital_gain parameter, the Digital
                                volume control will allow up to 24dB of
                                gain. If this parameter is enabled, it is the
                                responsibility of the user to ensure that
                                the Digital volume control is set to a value
                                that does not result in clipping/distortion!)



Name:   fe-pi-audio
Info:   Configures the Fe-Pi Audio Sound Card
Load:   dtoverlay=fe-pi-audio
Params: <None>





Name:   hifiberry-amp
Info:   Configures the HifiBerry Amp and Amp+ audio cards
Load:   dtoverlay=hifiberry-amp
Params: <None>


Name:   hifiberry-dac
Info:   Configures the HifiBerry DAC audio card
Load:   dtoverlay=hifiberry-dac
Params: <None>


Name:   hifiberry-dacplus
Info:   Configures the HifiBerry DAC+ audio card
Load:   dtoverlay=hifiberry-dacplus,<param>=<val>
Params: 24db_digital_gain       Allow gain to be applied via the PCM512x codec
                                Digital volume control. Enable with
                                "dtoverlay=hifiberry-dacplus,24db_digital_gain"
                                (The default behaviour is that the Digital
                                volume control is limited to a maximum of
                                0dB. ie. it can attenuate but not provide
                                gain. For most users, this will be desired
                                as it will prevent clipping. By appending
                                the 24dB_digital_gain parameter, the Digital
                                volume control will allow up to 24dB of
                                gain. If this parameter is enabled, it is the
                                responsibility of the user to ensure that
                                the Digital volume control is set to a value
                                that does not result in clipping/distortion!)
        slave                   Force DAC+ Pro into slave mode, using Pi as
                                master for bit clock and frame clock.


Name:   hifiberry-digi
Info:   Configures the HifiBerry Digi and Digi+ audio card
Load:   dtoverlay=hifiberry-digi
Params: <None>


Name:   hifiberry-digi-pro
Info:   Configures the HifiBerry Digi+ Pro audio card
Load:   dtoverlay=hifiberry-digi-pro
Params: <None>







Name:   iqaudio-dac
Info:   Configures the IQaudio DAC audio card
Load:   dtoverlay=iqaudio-dac,<param>
Params: 24db_digital_gain       Allow gain to be applied via the PCM512x codec
                                Digital volume control. Enable with
                                "dtoverlay=iqaudio-dac,24db_digital_gain"
                                (The default behaviour is that the Digital
                                volume control is limited to a maximum of
                                0dB. ie. it can attenuate but not provide
                                gain. For most users, this will be desired
                                as it will prevent clipping. By appending
                                the 24db_digital_gain parameter, the Digital
                                volume control will allow up to 24dB of
                                gain. If this parameter is enabled, it is the
                                responsibility of the user to ensure that
                                the Digital volume control is set to a value
                                that does not result in clipping/distortion!)


Name:   iqaudio-dacplus
Info:   Configures the IQaudio DAC+ audio card
Load:   dtoverlay=iqaudio-dacplus,<param>=<val>
Params: 24db_digital_gain       Allow gain to be applied via the PCM512x codec
                                Digital volume control. Enable with
                                "dtoverlay=iqaudio-dacplus,24db_digital_gain"
                                (The default behaviour is that the Digital
                                volume control is limited to a maximum of
                                0dB. ie. it can attenuate but not provide
                                gain. For most users, this will be desired
                                as it will prevent clipping. By appending
                                the 24db_digital_gain parameter, the Digital
                                volume control will allow up to 24dB of
                                gain. If this parameter is enabled, it is the
                                responsibility of the user to ensure that
                                the Digital volume control is set to a value
                                that does not result in clipping/distortion!)
        auto_mute_amp           If specified, unmute/mute the IQaudIO amp when
                                starting/stopping audio playback.
        unmute_amp              If specified, unmute the IQaudIO amp once when
                                the DAC driver module loads.


Name:   iqaudio-digi-wm8804-audio
Info:   Configures the IQAudIO Digi WM8804 audio card
Load:   dtoverlay=iqaudio-digi-wm8804-audio,<param>=<val>
Params: card_name               Override the default, "IQAudIODigi", card name.
        dai_name                Override the default, "IQAudIO Digi", dai name.
        dai_stream_name         Override the default, "IQAudIO Digi HiFi",
                                dai stream name.


Name:   justboom-dac
Info:   Configures the JustBoom DAC HAT, Amp HAT, DAC Zero and Amp Zero audio
        cards
Load:   dtoverlay=justboom-dac,<param>=<val>
Params: 24db_digital_gain       Allow gain to be applied via the PCM512x codec
                                Digital volume control. Enable with
                                "dtoverlay=justboom-dac,24db_digital_gain"
                                (The default behaviour is that the Digital
                                volume control is limited to a maximum of
                                0dB. ie. it can attenuate but not provide
                                gain. For most users, this will be desired
                                as it will prevent clipping. By appending
                                the 24dB_digital_gain parameter, the Digital
                                volume control will allow up to 24dB of
                                gain. If this parameter is enabled, it is the
                                responsibility of the user to ensure that
                                the Digital volume control is set to a value
                                that does not result in clipping/distortion!)


Name:   justboom-digi
Info:   Configures the JustBoom Digi HAT and Digi Zero audio cards
Load:   dtoverlay=justboom-digi
Params: <None>





Name:   raspidac3
Info:   Configures the RaspiDAV Rev.3x audio card
Load:   dtoverlay=raspidac3
Params: <None>



Name:   rpi-cirrus-wm5102
Info:   Configures the Cirrus Logic Audio Card
Load:   dtoverlay=rpi-cirrus-wm5102
Params: <None>


Name:   rpi-dac
Info:   Configures the RPi DAC audio card
Load:   dtoverlay=rpi-dac
Params: <None>




