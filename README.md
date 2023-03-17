# Chain Lightning Company's Technical Challenges.

</br>

## Challenges
1. 플랫폼 (iOS, Android) 별 고유한 스타일을 적용.
2. 시스템 설정 또는 사용자 설정에 따라 다크모드 UI를 지원.
3. 시스템 설정 또는 사용자 설정에 따라 UI 폰트 크기를 지정.
4. 스캐너 버튼을 long-press 하면 카메라 컨트롤러가 실행되고, 손을 떼면 종료.
5. 실행된 카메라 컨트롤러를 통해 QR코드 인식.
6. 화면의 일부 영역만 스캔 인식 영역으로 지정.

</br>

## Packages
- provider: ^6.0.5                  // 상태 관리.
- permission_handler: ^10.2.0       // 카메라 사용 권한.
- flutter_platform_widgets: ^2.2.6  // 플랫폼마다 고유 테마 적용.
- qr_code_scanner: ^1.0.1           // QR Code 스캔.

</br>

## Test Videos
### AOS
<table>
  <tr>
    <td>
      Recognize_QR_Code
    </td>
    <td>
      Set_Font_Size
    </td>
    <td>
      Dark_Mode
    </td>
  </tr>
  <tr>
    <td>
      <video src='https://user-images.githubusercontent.com/41365432/225858065-66411fb9-2283-4586-96b1-0c31830c236b.mp4' width=30%/>
    </td>
    <td>
      <video src='https://user-images.githubusercontent.com/41365432/225858144-98f50d17-9de4-4d33-a64b-bfcc9c1e32e9.mp4' width=30%/>
    </td>
    <td>
      <video src='https://user-images.githubusercontent.com/41365432/225858354-a61488e8-0092-49af-b918-2258f04077ee.mp4' width=30%/>
    </td>
  </tr>
</table>

### iOS
<table>
  <tr>
    <td>
      Set_Font_Size
    </td>
    <td>
      Dark_Mode
    </td>
  </tr>
  <tr>
    <td>
      <video src='https://user-images.githubusercontent.com/41365432/225858459-bb84cf69-10b0-4143-8d1b-ef03053c11d4.mp4' width=30%/>
    </td>
    <td>
      <video src='https://user-images.githubusercontent.com/41365432/225858488-b0f6450e-269b-4014-ac69-d4e7c32b16f4.mp4' width=30%/>
    </td>
  </tr>
</table>
