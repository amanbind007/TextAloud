//
//  VoicesPickerView.swift
//  TextAloud
//
//

import SwiftUI
import Combine

struct VoicesPickerView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var settingVM: SettingViewModel
  
    var voices: [VoiceModel] {
        settingVM.voiceService.getVoicesModelForLanguage(settingVM.currentLanguage)
    }
    
    var uniquedLanguagesCodes: [String]{
        settingVM.voiceService.uniquedLanguagesCodes
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            if !uniquedLanguagesCodes.isEmpty{
                Label("Languages", systemImage: "globe")
                    .foregroundColor(.deepOcean)
                Picker(selection: $settingVM.currentLanguage) {
                    ForEach(uniquedLanguagesCodes, id: \.self) { code in
                        Text(code.getFullLocaleLanguageStr)
                            .tag(code)
                    }
                } label: {}.labelsHidden()
                .pickerStyle(.wheel)
                .onChange(of: settingVM.currentLanguage) { newValue in
                    if let id = voices.first?.id{
                        settingVM.tempVoiceId = id
                    }
                }

                if !settingVM.tempVoiceId.isEmpty{
                    Label("Voices", systemImage: "person.fill")
                        .foregroundColor(.deepOcean)
                    Picker(selection: $settingVM.tempVoiceId) {
                        ForEach(voices) { voice in
                            Text(voice.name)
                                .tag(voice.id)
                        }
                    } label: {}.labelsHidden()

                    .pickerStyle(.wheel)
                }

                HStack{
                    Button("Cancel") {
                        dismiss()
                    }
                    Spacer()
                    Button("Save") {
                        settingVM.saveVoice()
                        dismiss()
                    }
                }
                .font(.title3.bold())
                .padding(.horizontal)
                Spacer()
            }else{
                Text("aboutTextAloud \("Text Aloud")")
                    .font(.title3.weight(.medium))
                Button("Ok") {
                    dismiss()
                }
                .font(.title3.bold())
            }
           
        }
        .padding(.top, 30)
        .padding(.horizontal)
    }
}

struct VoicesPickerView_Previews: PreviewProvider {
    static var previews: some View {
        VoicesPickerView(settingVM: SettingViewModel())
    }
}


//[[AVSpeechSynthesisVoice 0x283b91c90] Language: ar-001, Name: Majed, Quality: Default [com.apple.voice.compact.ar-001.Maged], [AVSpeechSynthesisVoice 0x283b925d0] Language: bg-BG, Name: Daria, Quality: Default [com.apple.voice.compact.bg-BG.Daria], [AVSpeechSynthesisVoice 0x283b91b00] Language: ca-ES, Name: Montse, Quality: Default [com.apple.voice.compact.ca-ES.Montserrat], [AVSpeechSynthesisVoice 0x283b92200] Language: cs-CZ, Name: Zuzana, Quality: Default [com.apple.voice.compact.cs-CZ.Zuzana], [AVSpeechSynthesisVoice 0x283b91d60] Language: da-DK, Name: Sara, Quality: Default [com.apple.voice.compact.da-DK.Sara], [AVSpeechSynthesisVoice 0x283b918b0] Language: de-DE, Name: Sandy, Quality: Default [com.apple.eloquence.de-DE.Sandy], [AVSpeechSynthesisVoice 0x283b91a70] Language: de-DE, Name: Shelley, Quality: Default [com.apple.eloquence.de-DE.Shelley], [AVSpeechSynthesisVoice 0x283b91ae0] Language: de-DE, Name: Helena, Quality: Default [com.apple.ttsbundle.siri_Helena_de-DE_compact], [AVSpeechSynthesisVoice 0x283b91b50] Language: de-DE, Name: Grandma, Quality: Default [com.apple.eloquence.de-DE.Grandma], [AVSpeechSynthesisVoice 0x283b91c50] Language: de-DE, Name: Grandpa, Quality: Default [com.apple.eloquence.de-DE.Grandpa], [AVSpeechSynthesisVoice 0x283b91ce0] Language: de-DE, Name: Eddy, Quality: Default [com.apple.eloquence.de-DE.Eddy], [AVSpeechSynthesisVoice 0x283b91eb0] Language: de-DE, Name: Reed, Quality: Default [com.apple.eloquence.de-DE.Reed], [AVSpeechSynthesisVoice 0x283b920f0] Language: de-DE, Name: Anna, Quality: Default [com.apple.voice.compact.de-DE.Anna], [AVSpeechSynthesisVoice 0x283b921c0] Language: de-DE, Name: Martin, Quality: Default [com.apple.ttsbundle.siri_Martin_de-DE_compact], [AVSpeechSynthesisVoice 0x283b921f0] Language: de-DE, Name: Rocko, Quality: Default [com.apple.eloquence.de-DE.Rocko], [AVSpeechSynthesisVoice 0x283b924e0] Language: de-DE, Name: Flo, Quality: Default [com.apple.eloquence.de-DE.Flo], [AVSpeechSynthesisVoice 0x283b920a0] Language: el-GR, Name: Melina, Quality: Default [com.apple.voice.compact.el-GR.Melina], [AVSpeechSynthesisVoice 0x283b91c10] Language: en-AU, Name: Gordon, Quality: Default [com.apple.ttsbundle.siri_Gordon_en-AU_compact], [AVSpeechSynthesisVoice 0x283b91f30] Language: en-AU, Name: Karen, Quality: Default [com.apple.voice.compact.en-AU.Karen], [AVSpeechSynthesisVoice 0x283b925a0] Language: en-AU, Name: Catherine, Quality: Default [com.apple.ttsbundle.siri_Catherine_en-AU_compact], [AVSpeechSynthesisVoice 0x283b91c40] Language: en-GB, Name: Rocko, Quality: Default [com.apple.eloquence.en-GB.Rocko], [AVSpeechSynthesisVoice 0x283b91d20] Language: en-GB, Name: Shelley, Quality: Default [com.apple.eloquence.en-GB.Shelley], [AVSpeechSynthesisVoice 0x283b91d50] Language: en-GB, Name: Daniel, Quality: Default [com.apple.voice.compact.en-GB.Daniel], [AVSpeechSynthesisVoice 0x283b91df0] Language: en-GB, Name: Martha, Quality: Default [com.apple.ttsbundle.siri_Martha_en-GB_compact], [AVSpeechSynthesisVoice 0x283b91e70] Language: en-GB, Name: Grandma, Quality: Default [com.apple.eloquence.en-GB.Grandma], [AVSpeechSynthesisVoice 0x283b91f10] Language: en-GB, Name: Grandpa, Quality: Default [com.apple.eloquence.en-GB.Grandpa], [AVSpeechSynthesisVoice 0x283b92000] Language: en-GB, Name: Flo, Quality: Default [com.apple.eloquence.en-GB.Flo], [AVSpeechSynthesisVoice 0x283b92340] Language: en-GB, Name: Eddy, Quality: Default [com.apple.eloquence.en-GB.Eddy], [AVSpeechSynthesisVoice 0x283b92480] Language: en-GB, Name: Reed, Quality: Default [com.apple.eloquence.en-GB.Reed], [AVSpeechSynthesisVoice 0x283b92490] Language: en-GB, Name: Sandy, Quality: Default [com.apple.eloquence.en-GB.Sandy], [AVSpeechSynthesisVoice 0x283b92680] Language: en-GB, Name: Arthur, Quality: Default [com.apple.ttsbundle.siri_Arthur_en-GB_compact], [AVSpeechSynthesisVoice 0x283b92330] Language: en-IE, Name: Moira, Quality: Default [com.apple.voice.compact.en-IE.Moira], [AVSpeechSynthesisVoice 0x283b91b40] Language: en-IN, Name: Rishi, Quality: Default [com.apple.voice.compact.en-IN.Rishi], [AVSpeechSynthesisVoice 0x283b91880] Language: en-US, Name: Flo, Quality: Default [com.apple.eloquence.en-US.Flo], [AVSpeechSynthesisVoice 0x283b91900] Language: en-US, Name: Bahh, Quality: Default [com.apple.speech.synthesis.voice.Bahh], [AVSpeechSynthesisVoice 0x283b91910] Language: en-US, Name: Albert, Quality: Default [com.apple.speech.synthesis.voice.Albert], [AVSpeechSynthesisVoice 0x283b91920] Language: en-US, Name: Fred, Quality: Default [com.apple.speech.synthesis.voice.Fred], [AVSpeechSynthesisVoice 0x283b91930] Language: en-US, Name: Jester, Quality: Default [com.apple.speech.synthesis.voice.Hysterical], [AVSpeechSynthesisVoice 0x283b91960] Language: en-US, Name: Organ, Quality: Default [com.apple.speech.synthesis.voice.Organ], [AVSpeechSynthesisVoice 0x283b91a00] Language: en-US, Name: Cellos, Quality: Default [com.apple.speech.synthesis.voice.Cellos], [AVSpeechSynthesisVoice 0x283b91b30] Language: en-US, Name: Zarvox, Quality: Default [com.apple.speech.synthesis.voice.Zarvox], [AVSpeechSynthesisVoice 0x283b91ba0] Language: en-US, Name: Rocko, Quality: Default [com.apple.eloquence.en-US.Rocko], [AVSpeechSynthesisVoice 0x283b91be0] Language: en-US, Name: Shelley, Quality: Default [com.apple.eloquence.en-US.Shelley], [AVSpeechSynthesisVoice 0x283b91c20] Language: en-US, Name: Superstar, Quality: Default [com.apple.speech.synthesis.voice.Princess], [AVSpeechSynthesisVoice 0x283b91d80] Language: en-US, Name: Grandma, Quality: Default [com.apple.eloquence.en-US.Grandma], [AVSpeechSynthesisVoice 0x283b91da0] Language: en-US, Name: Eddy, Quality: Default [com.apple.eloquence.en-US.Eddy], [AVSpeechSynthesisVoice 0x283b91dc0] Language: en-US, Name: Bells, Quality: Default [com.apple.speech.synthesis.voice.Bells], [AVSpeechSynthesisVoice 0x283b91e60] Language: en-US, Name: Grandpa, Quality: Default [com.apple.eloquence.en-US.Grandpa], [AVSpeechSynthesisVoice 0x283b91e80] Language: en-US, Name: Trinoids, Quality: Default [com.apple.speech.synthesis.voice.Trinoids], [AVSpeechSynthesisVoice 0x283b91ea0] Language: en-US, Name: Kathy, Quality: Default [com.apple.speech.synthesis.voice.Kathy], [AVSpeechSynthesisVoice 0x283b91fa0] Language: en-US, Name: Reed, Quality: Default [com.apple.eloquence.en-US.Reed], [AVSpeechSynthesisVoice 0x283b92090] Language: en-US, Name: Boing, Quality: Default [com.apple.speech.synthesis.voice.Boing], [AVSpeechSynthesisVoice 0x283b920b0] Language: en-US, Name: Whisper, Quality: Default [com.apple.speech.synthesis.voice.Whisper], [AVSpeechSynthesisVoice 0x283b92140] Language: en-US, Name: Wobble, Quality: Default [com.apple.speech.synthesis.voice.Deranged], [AVSpeechSynthesisVoice 0x283b92150] Language: en-US, Name: Good News, Quality: Default [com.apple.speech.synthesis.voice.GoodNews], [AVSpeechSynthesisVoice 0x283b92180] Language: en-US, Name: Nicky, Quality: Default [com.apple.ttsbundle.siri_Nicky_en-US_compact], [AVSpeechSynthesisVoice 0x283b921d0] Language: en-US, Name: Bad News, Quality: Default [com.apple.speech.synthesis.voice.BadNews], [AVSpeechSynthesisVoice 0x283b92240] Language: en-US, Name: Aaron, Quality: Default [com.apple.ttsbundle.siri_Aaron_en-US_compact], [AVSpeechSynthesisVoice 0x283b92260] Language: en-US, Name: Bubbles, Quality: Default [com.apple.speech.synthesis.voice.Bubbles], [AVSpeechSynthesisVoice 0x283b92420] Language: en-US, Name: Samantha, Quality: Default [com.apple.voice.compact.en-US.Samantha], [AVSpeechSynthesisVoice 0x283b92430] Language: en-US, Name: Sandy, Quality: Default [com.apple.eloquence.en-US.Sandy], [AVSpeechSynthesisVoice 0x283b92450] Language: en-US, Name: Junior, Quality: Default [com.apple.speech.synthesis.voice.Junior], [AVSpeechSynthesisVoice 0x283b92660] Language: en-US, Name: Ralph, Quality: Default [com.apple.speech.synthesis.voice.Ralph], [AVSpeechSynthesisVoice 0x283b91ef0] Language: en-ZA, Name: Tessa, Quality: Default [com.apple.voice.compact.en-ZA.Tessa], [AVSpeechSynthesisVoice 0x283b91c70] Language: es-ES, Name: Shelley, Quality: Default [com.apple.eloquence.es-ES.Shelley], [AVSpeechSynthesisVoice 0x283b91de0] Language: es-ES, Name: Grandma, Quality: Default [com.apple.eloquence.es-ES.Grandma], [AVSpeechSynthesisVoice 0x283b91e50] Language: es-ES, Name: Rocko, Quality: Default [com.apple.eloquence.es-ES.Rocko], [AVSpeechSynthesisVoice 0x283b91ec0] Language: es-ES, Name: Grandpa, Quality: Default [com.apple.eloquence.es-ES.Grandpa], [AVSpeechSynthesisVoice 0x283b92100] Language: es-ES, Name: Mónica, Quality: Default [com.apple.voice.compact.es-ES.Monica], [AVSpeechSynthesisVoice 0x283b92110] Language: es-ES, Name: Sandy, Quality: Default [com.apple.eloquence.es-ES.Sandy], [AVSpeechSynthesisVoice 0x283b92160] Language: es-ES, Name: Flo, Quality: Default [com.apple.eloquence.es-ES.Flo], [AVSpeechSynthesisVoice 0x283b92500] Language: es-ES, Name: Eddy, Quality: Default [com.apple.eloquence.es-ES.Eddy], [AVSpeechSynthesisVoice 0x283b92690] Language: es-ES, Name: Reed, Quality: Default [com.apple.eloquence.es-ES.Reed], [AVSpeechSynthesisVoice 0x283b917d0] Language: es-MX, Name: Rocko, Quality: Default [com.apple.eloquence.es-MX.Rocko], [AVSpeechSynthesisVoice 0x283b91810] Language: es-MX, Name: Paulina, Quality: Default [com.apple.voice.compact.es-MX.Paulina], [AVSpeechSynthesisVoice 0x283b91fd0] Language: es-MX, Name: Flo, Quality: Default [com.apple.eloquence.es-MX.Flo], [AVSpeechSynthesisVoice 0x283b92030] Language: es-MX, Name: Sandy, Quality: Default [com.apple.eloquence.es-MX.Sandy], [AVSpeechSynthesisVoice 0x283b922b0] Language: es-MX, Name: Eddy, Quality: Default [com.apple.eloquence.es-MX.Eddy], [AVSpeechSynthesisVoice 0x283b92300] Language: es-MX, Name: Shelley, Quality: Default [com.apple.eloquence.es-MX.Shelley], [AVSpeechSynthesisVoice 0x283b92390] Language: es-MX, Name: Grandma, Quality: Default [com.apple.eloquence.es-MX.Grandma], [AVSpeechSynthesisVoice 0x283b923a0] Language: es-MX, Name: Reed, Quality: Default [com.apple.eloquence.es-MX.Reed], [AVSpeechSynthesisVoice 0x283b92470] Language: es-MX, Name: Grandpa, Quality: Default [com.apple.eloquence.es-MX.Grandpa], [AVSpeechSynthesisVoice 0x283b919a0] Language: fi-FI, Name: Shelley, Quality: Default [com.apple.eloquence.fi-FI.Shelley], [AVSpeechSynthesisVoice 0x283b91a50] Language: fi-FI, Name: Grandma, Quality: Default [com.apple.eloquence.fi-FI.Grandma], [AVSpeechSynthesisVoice 0x283b91ad0] Language: fi-FI, Name: Grandpa, Quality: Default [com.apple.eloquence.fi-FI.Grandpa], [AVSpeechSynthesisVoice 0x283b91af0] Language: fi-FI, Name: Sandy, Quality: Default [com.apple.eloquence.fi-FI.Sandy], [AVSpeechSynthesisVoice 0x283b91ee0] Language: fi-FI, Name: Satu, Quality: Default [com.apple.voice.compact.fi-FI.Satu], [AVSpeechSynthesisVoice 0x283b922e0] Language: fi-FI, Name: Eddy, Quality: Default [com.apple.eloquence.fi-FI.Eddy], [AVSpeechSynthesisVoice 0x283b923e0] Language: fi-FI, Name: Rocko, Quality: Default [com.apple.eloquence.fi-FI.Rocko], [AVSpeechSynthesisVoice 0x283b92410] Language: fi-FI, Name: Reed, Quality: Default [com.apple.eloquence.fi-FI.Reed], [AVSpeechSynthesisVoice 0x283b925c0] Language: fi-FI, Name: Flo, Quality: Default [com.apple.eloquence.fi-FI.Flo], [AVSpeechSynthesisVoice 0x283b918f0] Language: fr-CA, Name: Shelley, Quality: Default [com.apple.eloquence.fr-CA.Shelley], [AVSpeechSynthesisVoice 0x283b919e0] Language: fr-CA, Name: Grandma, Quality: Default [com.apple.eloquence.fr-CA.Grandma], [AVSpeechSynthesisVoice 0x283b91a40] Language: fr-CA, Name: Grandpa, Quality: Default [com.apple.eloquence.fr-CA.Grandpa], [AVSpeechSynthesisVoice 0x283b91a60] Language: fr-CA, Name: Rocko, Quality: Default [com.apple.eloquence.fr-CA.Rocko], [AVSpeechSynthesisVoice 0x283b91d90] Language: fr-CA, Name: Eddy, Quality: Default [com.apple.eloquence.fr-CA.Eddy], [AVSpeechSynthesisVoice 0x283b92020] Language: fr-CA, Name: Reed, Quality: Default [com.apple.eloquence.fr-CA.Reed], [AVSpeechSynthesisVoice 0x283b92270] Language: fr-CA, Name: Amélie, Quality: Default [com.apple.voice.compact.fr-CA.Amelie], [AVSpeechSynthesisVoice 0x283b922a0] Language: fr-CA, Name: Flo, Quality: Default [com.apple.eloquence.fr-CA.Flo], [AVSpeechSynthesisVoice 0x283b92310] Language: fr-CA, Name: Sandy, Quality: Default [com.apple.eloquence.fr-CA.Sandy], [AVSpeechSynthesisVoice 0x283b917e0] Language: fr-FR, Name: Grandma, Quality: Default [com.apple.eloquence.fr-FR.Grandma], [AVSpeechSynthesisVoice 0x283b91820] Language: fr-FR, Name: Flo, Quality: Default [com.apple.eloquence.fr-FR.Flo], [AVSpeechSynthesisVoice 0x283b91830] Language: fr-FR, Name: Rocko, Quality: Default [com.apple.eloquence.fr-FR.Rocko], [AVSpeechSynthesisVoice 0x283b91860] Language: fr-FR, Name: Grandpa, Quality: Default [com.apple.eloquence.fr-FR.Grandpa], [AVSpeechSynthesisVoice 0x283b919b0] Language: fr-FR, Name: Sandy, Quality: Default [com.apple.eloquence.fr-FR.Sandy], [AVSpeechSynthesisVoice 0x283b91b20] Language: fr-FR, Name: Eddy, Quality: Default [com.apple.eloquence.fr-FR.Eddy], [AVSpeechSynthesisVoice 0x283b91ca0] Language: fr-FR, Name: Daniel, Quality: Default [com.apple.ttsbundle.siri_Daniel_fr-FR_compact], [AVSpeechSynthesisVoice 0x283b91ed0] Language: fr-FR, Name: Thomas, Quality: Default [com.apple.voice.compact.fr-FR.Thomas], [AVSpeechSynthesisVoice 0x283b92350] Language: fr-FR, Name: Jacques, Quality: Default [com.apple.eloquence.fr-FR.Jacques], [AVSpeechSynthesisVoice 0x283b925e0] Language: fr-FR, Name: Marie, Quality: Default [com.apple.ttsbundle.siri_Marie_fr-FR_compact], [AVSpeechSynthesisVoice 0x283b925f0] Language: fr-FR, Name: Shelley, Quality: Default [com.apple.eloquence.fr-FR.Shelley], [AVSpeechSynthesisVoice 0x283b92540] Language: he-IL, Name: Carmit, Quality: Default [com.apple.voice.compact.he-IL.Carmit], [AVSpeechSynthesisVoice 0x283b91d70] Language: hi-IN, Name: Lekha, Quality: Default [com.apple.voice.compact.hi-IN.Lekha], [AVSpeechSynthesisVoice 0x283b92570] Language: hr-HR, Name: Lana, Quality: Default [com.apple.voice.compact.hr-HR.Lana], [AVSpeechSynthesisVoice 0x283b92170] Language: hu-HU, Name: Tünde, Quality: Default [com.apple.voice.compact.hu-HU.Mariska], [AVSpeechSynthesisVoice 0x283b92250] Language: id-ID, Name: Damayanti, Quality: Default [com.apple.voice.compact.id-ID.Damayanti], [AVSpeechSynthesisVoice 0x283b919d0] Language: it-IT, Name: Eddy, Quality: Default [com.apple.eloquence.it-IT.Eddy], [AVSpeechSynthesisVoice 0x283b919f0] Language: it-IT, Name: Sandy, Quality: Default [com.apple.eloquence.it-IT.Sandy], [AVSpeechSynthesisVoice 0x283b91a80] Language: it-IT, Name: Reed, Quality: Default [com.apple.eloquence.it-IT.Reed], [AVSpeechSynthesisVoice 0x283b91dd0] Language: it-IT, Name: Shelley, Quality: Default [com.apple.eloquence.it-IT.Shelley], [AVSpeechSynthesisVoice 0x283b91f60] Language: it-IT, Name: Grandma, Quality: Default [com.apple.eloquence.it-IT.Grandma], [AVSpeechSynthesisVoice 0x283b92060] Language: it-IT, Name: Grandpa, Quality: Default [com.apple.eloquence.it-IT.Grandpa], [AVSpeechSynthesisVoice 0x283b92290] Language: it-IT, Name: Flo, Quality: Default [com.apple.eloquence.it-IT.Flo], [AVSpeechSynthesisVoice 0x283b92320] Language: it-IT, Name: Rocko, Quality: Default [com.apple.eloquence.it-IT.Rocko], [AVSpeechSynthesisVoice 0x283b924f0] Language: it-IT, Name: Alice, Quality: Default [com.apple.voice.compact.it-IT.Alice], [AVSpeechSynthesisVoice 0x283b91940] Language: ja-JP, Name: O-ren, Quality: Default [com.apple.ttsbundle.siri_O-ren_ja-JP_compact], [AVSpeechSynthesisVoice 0x283b91d10] Language: ja-JP, Name: Kyoko, Quality: Default [com.apple.voice.compact.ja-JP.Kyoko], [AVSpeechSynthesisVoice 0x283b92010] Language: ja-JP, Name: Hattori, Quality: Default [com.apple.ttsbundle.siri_Hattori_ja-JP_compact], [AVSpeechSynthesisVoice 0x283b91f20] Language: ko-KR, Name: Yuna, Quality: Default [com.apple.voice.compact.ko-KR.Yuna], [AVSpeechSynthesisVoice 0x283b91ff0] Language: ms-MY, Name: Amira, Quality: Default [com.apple.voice.compact.ms-MY.Amira], [AVSpeechSynthesisVoice 0x283b917f0] Language: nb-NO, Name: Nora, Quality: Default [com.apple.voice.compact.nb-NO.Nora], [AVSpeechSynthesisVoice 0x283b91b90] Language: nl-BE, Name: Ellen, Quality: Default [com.apple.voice.compact.nl-BE.Ellen], [AVSpeechSynthesisVoice 0x283b91c30] Language: nl-NL, Name: Xander, Quality: Default [com.apple.voice.compact.nl-NL.Xander], [AVSpeechSynthesisVoice 0x283b91fb0] Language: pl-PL, Name: Zosia, Quality: Default [com.apple.voice.compact.pl-PL.Zosia], [AVSpeechSynthesisVoice 0x283b910e0] Language: pt-BR, Name: Reed, Quality: Default [com.apple.eloquence.pt-BR.Reed], [AVSpeechSynthesisVoice 0x283b917c0] Language: pt-BR, Name: Luciana, Quality: Default [com.apple.voice.compact.pt-BR.Luciana], [AVSpeechSynthesisVoice 0x283b91ac0] Language: pt-BR, Name: Shelley, Quality: Default [com.apple.eloquence.pt-BR.Shelley], [AVSpeechSynthesisVoice 0x283b91bb0] Language: pt-BR, Name: Grandma, Quality: Default [com.apple.eloquence.pt-BR.Grandma], [AVSpeechSynthesisVoice 0x283b91c80] Language: pt-BR, Name: Grandpa, Quality: Default [com.apple.eloquence.pt-BR.Grandpa], [AVSpeechSynthesisVoice 0x283b91d30] Language: pt-BR, Name: Rocko, Quality: Default [com.apple.eloquence.pt-BR.Rocko], [AVSpeechSynthesisVoice 0x283b923c0] Language: pt-BR, Name: Flo, Quality: Default [com.apple.eloquence.pt-BR.Flo], [AVSpeechSynthesisVoice 0x283b924a0] Language: pt-BR, Name: Sandy, Quality: Default [com.apple.eloquence.pt-BR.Sandy], [AVSpeechSynthesisVoice 0x283b925b0] Language: pt-BR, Name: Eddy, Quality: Default [com.apple.eloquence.pt-BR.Eddy], [AVSpeechSynthesisVoice 0x283b92040] Language: pt-PT, Name: Joana, Quality: Default [com.apple.voice.compact.pt-PT.Joana], [AVSpeechSynthesisVoice 0x283b91890] Language: ro-RO, Name: Ioana, Quality: Default [com.apple.voice.compact.ro-RO.Ioana], [AVSpeechSynthesisVoice 0x283b923b0] Language: ru-RU, Name: Milena, Quality: Default [com.apple.voice.compact.ru-RU.Milena], [AVSpeechSynthesisVoice 0x283b92550] Language: sk-SK, Name: Laura, Quality: Default [com.apple.voice.compact.sk-SK.Laura], [AVSpeechSynthesisVoice 0x283b921e0] Language: sv-SE, Name: Alva, Quality: Default [com.apple.voice.compact.sv-SE.Alva], [AVSpeechSynthesisVoice 0x283b91fc0] Language: th-TH, Name: Kanya, Quality: Default [com.apple.voice.compact.th-TH.Kanya], [AVSpeechSynthesisVoice 0x283b92560] Language: tr-TR, Name: Yelda, Quality: Default [com.apple.voice.compact.tr-TR.Yelda], [AVSpeechSynthesisVoice 0x283b92120] Language: uk-UA, Name: Lesya, Quality: Default [com.apple.voice.compact.uk-UA.Lesya], [AVSpeechSynthesisVoice 0x283b926a0] Language: vi-VN, Name: Linh, Quality: Default [com.apple.voice.compact.vi-VN.Linh], [AVSpeechSynthesisVoice 0x283b91c00] Language: zh-CN, Name: Li-mu, Quality: Default [com.apple.ttsbundle.siri_Li-mu_zh-CN_compact], [AVSpeechSynthesisVoice 0x283b92460] Language: zh-CN, Name: Tingting, Quality: Default [com.apple.voice.compact.zh-CN.Tingting], [AVSpeechSynthesisVoice 0x283b92580] Language: zh-CN, Name: Yu-shu, Quality: Default [com.apple.ttsbundle.siri_Yu-shu_zh-CN_compact], [AVSpeechSynthesisVoice 0x283b913e0] Language: zh-HK, Name: Sinji, Quality: Default [com.apple.voice.compact.zh-HK.Sinji], [AVSpeechSynthesisVoice 0x283b92630] Language: zh-TW, Name: Meijia, Quality: Default [com.apple.voice.compact.zh-TW.Meijia]]